// mosaic.cpp (Part A)

#include "mosaic.h"
#include "utils.h"
#include <assert.h>
 
using namespace std;
using namespace Eigen;

// Recover the homography between 2 sets of corresponding points using least squares
// input: im1Points and im2Points are n-by-2 matrices holding the (x,y) locations
// of n point correspondences from the two images
// output: the recovered 3x3 homography matrix
Matrix3f computeHomography(const vector<vector<int>> im1Points, const vector<vector<int>> im2Points)
{
    if (im1Points.size() != im2Points.size() || im1Points.size() < 4) {
        throw MismatchedSizeException();
    }

    // form matrix A and vector b
    int n = im1Points.size();
    MatrixXf A = MatrixXf::Zero(2*n, 8); // 2n by 8 matrix
    VectorXf b(2*n); // 2n by 1 vector
	for (int i = 0; i < n; i++) {
        A(2*i, 0) = im1Points[i][0]; // x
        A(2*i, 1) = im1Points[i][1]; // y
        A(2*i, 2) = 1;
        A(2*i, 6) = - im1Points[i][0] * im2Points[i][0]; // -x*x'
        A(2*i, 7) = - im1Points[i][1] * im2Points[i][0]; // -y*x'

        A(2*i + 1, 3) = im2Points[i][0]; // x'
        A(2*i + 1, 4) = im2Points[i][1]; // y'
        A(2*i + 1, 5) = 1;
        A(2*i + 1, 6) = - im1Points[i][0] * im2Points[i][1]; // -x*y'
        A(2*i + 1, 7) = - im1Points[i][1] * im2Points[i][1]; // -y*y'

        b(2*i) = im2Points[i][0]; // x'
        b(2*i + 1) = im2Points[i][1]; // y'
    }
    
    // solve Ah = b and form homography matrix H
    VectorXf h = A.colPivHouseholderQr().solve(b); // solve using QR decomposition
    Matrix3f H(3, 3);
    H(0, 0) = h(0); H(0, 1) = h(1); H(0, 2) = h(2);
    H(1, 0) = h(3); H(1, 1) = h(4); H(1, 2) = h(5);
    H(2, 0) = h(6); H(2, 1) = h(7); H(2, 2) = 1;
    return H;
}

// Use bilinear interpolation to assign the value of a location from its neighboring pixel values
float interpolateLin(const FloatImage &im, float x, float y, int z, bool clamp)
{
	// interpolate along x for top left and top right
	int x1 = floor(x);
	int x2 = floor(x) + 1;
	int y1 = floor(y);
	float t = x - x1;
	float top = im.smartAccessor(x1, y1, z, clamp) * (1 - t) + im.smartAccessor(x2, y1, z, clamp) * t;

	// interpolate along x for bottom left and bottom right
	int y2 = floor(y) + 1;
	float bottom = im.smartAccessor(x1, y2, z, clamp) * (1 - t) + im.smartAccessor(x2, y2, z, clamp) * t;

	// interpolate along y for top and bottom
	t = y - y1;
	float output = top * (1 - t) + bottom * t;
	
	//return final float value
    return output;
}

// Compute the bounding box coordinates of an image after applying a given homography
// input: width and height of an image and a homography matrix H
// output: a vector storing [xmin, xmax, ymin, ymax]
vector<float> computeTransformedBBox(int width, int height, Matrix3f H) {
    Vector3f topLeft, topRight, bottomLeft, bottomRight;
    topLeft << 0, 0, 1;
    topRight << width, 0, 1;
    bottomLeft << 0, height, 1;
    bottomRight << width, height, 1;
    topLeft = H * topLeft;
    topRight = H * topRight;
    bottomLeft = H * bottomLeft;
    bottomRight = H * bottomRight;

    vector<float> result;
    result.push_back(min(topLeft[0] / topLeft[2], bottomLeft[0] / bottomLeft[2])); // xmin
    result.push_back(max(topRight[0] / topRight[2], bottomRight[0] / bottomRight[2])); // xmax
    result.push_back(min(topLeft[1] / topLeft[2], topRight[1] / topRight[2])); // ymin
    result.push_back(max(bottomLeft[1] / bottomLeft[2], bottomRight[1] / bottomRight[2])); // ymax
    return result;
}

// Warp an image using a given homography matrix and bilinear interpolation
// input: im is the input image to be warped and H is the homography matrix
// output: the warped image
FloatImage warpImage(const FloatImage &im, const Matrix3f H)
{
    vector<float> bbox1 = computeTransformedBBox(im.width(), im.height(), H);
    float tx = bbox1[0];
    float ty = bbox1[2];
    int width = (int) (bbox1[1] - bbox1[0]);
    int height = (int) (bbox1[3] - bbox1[2]);
    FloatImage output(width, height, im.channels());

	for (int i = 0; i < output.width(); i++) {
		for (int j = 0; j < output.height(); j++) {
			for (int c = 0; c < output.channels(); c++) {
                Vector3f imCoords;
                imCoords << i + tx, j + ty, 1;
                Vector3f outCoords = H.inverse() * imCoords; // use inverse warping
				float x = outCoords(0) / outCoords(2);
                float y = outCoords(1) / outCoords(2);
				output(i, j, c) = interpolateLin(im, x, y, c, false);
			}
		}
	}
	return output;
}

// Rectify an image given 2 sets of corresponding points
// input: im is the input image to be rectified, im1Points and im2Points are n-by-2 matrices
// holding the (x,y) locations of n point correspondences from the two images
// output: the warped image
FloatImage rectifyImage(const FloatImage &im, const std::vector<std::vector<int>> im1Points, const std::vector<std::vector<int>> im2Points)
{
    if (im1Points.size() != im2Points.size() || im1Points.size() < 4) {
        throw MismatchedSizeException();
    }
    Matrix3f H = computeHomography(im1Points, im2Points);
    return warpImage(im, H);
}

// Stitch 2 images together given 2 sets of corresponding points (warp the left image)
// input: im1 and im2 are the left and right images to be stitched together,
// im1Points and im2Points are n-by-2 matrices holding the (x,y) locations
// of n point correspondences
// output: the stitched panorama image
FloatImage stitch(const FloatImage &im1, const FloatImage &im2, const vector<vector<int>> im1Points, const vector<vector<int>> im2Points)
{
    if (im1Points.size() != im2Points.size() || im1Points.size() < 4) {
        throw MismatchedSizeException();
    }

    // warp left image and determine output image size
    Matrix3f H = computeHomography(im1Points, im2Points);
    cout << H << endl;
    FloatImage outIm1 = warpImage(im1, H);
    // outIm1.write("../data/output/part-A/warped-left-image.jpg");
    vector<float> bbox1 = computeTransformedBBox(im1.width(), im1.height(), H);
    float tx = bbox1[0];
    float ty = bbox1[2];
    int width = im2.width() - tx;
    int height = max((int) (bbox1[3] - bbox1[2]), (int) im2.height());

    // for linear/sigmoid blending
    int overlap_x1 = - tx;
    int overlap_x2 = bbox1[1] - tx;
    float mid = (overlap_x1 + overlap_x2) / 2.f;

    // combine warped left image and right image to form output image
    FloatImage output(width, height, im1.channels());
    for (int i = 0; i < output.width(); i++) {
		for (int j = 0; j < output.height(); j++) {
			for (int c = 0; c < output.channels(); c++) {
                float val1 = outIm1.smartAccessor(i, j, c, false);
                float val2 = im2.smartAccessor(i + tx, j + ty, c, false);
				output(i, j, c) = val1 + val2;
                if (val1 != 0 && val2 != 0) {
                    // output(i, j, c) = val1; // simple overlap
                    // float alpha = ((float) i - overlap_x1) / (overlap_x2 - overlap_x1); // linear blend
                    float alpha = 1 / (1 + exp(mid - i)); // sigmoid blend
                    output(i, j, c) = val1 * (1 - alpha) + val2 * alpha;
                }
			}
		}
	}
    return output;
}

// Stitch 2 images together given 2 sets of corresponding points
// (same as stitch(), but warp both images)
// input: im1 and im2 are the left and right images to be stitched together,
// im1Points and im2Points are n-by-2 matrices holding the (x,y) locations
// of n point correspondences
// output: the stitched panorama image
FloatImage stitchWarpBoth(const FloatImage &im1, const FloatImage &im2, const vector<vector<int>> im1Points, const vector<vector<int>> im2Points)
{
    if (im1Points.size() != im2Points.size() || im1Points.size() < 4) {
        throw MismatchedSizeException();
    }

    // compute the average of the two sets of corresponding points
    vector<vector<int>> avgPoints;
    for (int i = 0; i < (int) im1Points.size(); i++) {
        vector<int> point;
        point.push_back((im1Points[i][0] + im2Points[i][0]) / 2);
        point.push_back((im1Points[i][1] + im2Points[i][1]) / 2);
        avgPoints.push_back(point);
    }

    // warp both images and determine output image size
    Matrix3f H1 = computeHomography(im1Points, avgPoints);
    Matrix3f H2 = computeHomography(im2Points, avgPoints);
    FloatImage outIm1 = warpImage(im1, H1);
    FloatImage outIm2 = warpImage(im2, H2);
    vector<float> bbox1 = computeTransformedBBox(im1.width(), im1.height(), H1);
    vector<float> bbox2 = computeTransformedBBox(im2.width(), im2.height(), H2);
    float tx1 = bbox1[0];
    float ty1 = bbox1[2];
    float tx2 = bbox2[0];
    int width = bbox2[1] - bbox1[0];
    int height = (int) (max(bbox1[3], bbox2[3]) - min(bbox1[2], bbox2[2]));

    // for sigmoid blending
    int overlap_x1 = bbox2[0] - tx1;
    int overlap_x2 = bbox1[1] - tx1;
    float mid = (overlap_x1 + overlap_x2) / 2.f;

    // combine warped images to form output image
    FloatImage output(width, height, im1.channels());
    for (int i = 0; i < output.width(); i++) {
		for (int j = 0; j < output.height(); j++) {
			for (int c = 0; c < output.channels(); c++) {
                float val1 = outIm1.smartAccessor(i, j, c, false);
                float val2 = outIm2.smartAccessor(i + tx1 - tx2, j + ty1, c, false);
				output(i, j, c) = val1 + val2;
                if (val1 != 0 && val2 != 0) {
                    // output(i, j, c) = val1; // simple overlap
                    // float alpha = ((float) i - overlap_x1) / (overlap_x2 - overlap_x1); // linear blend
                    float alpha = 1 / (1 + exp(mid - i)); // sigmoid blend
                    output(i, j, c) = val1 * (1 - alpha) + val2 * alpha;
                }
			}
		}
	}
    return output;
}
