// panorama.cpp

#include "panorama.h"
#include "utils.h"
#include <assert.h>
 
using namespace std;
using namespace Eigen;

// Recover the homography between two sets of points using least squares
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

// using bilinear interpolation to assign the value of a location from its neighboring pixel values
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

// Warp an image using a given homography matrix
// input: im is the input image to be warped and H is the homography
// output: the warped image
FloatImage warpImage(const FloatImage &im, const Matrix3f H)
{
    FloatImage output(im.width(), im.height(), im.channels());

	for (int i = 0; i < output.width(); i++) {
		for (int j = 0; j < output.height(); j++) {
			for (int c = 0; c < output.channels(); c++) {
                Vector3f imCoords;
                imCoords << i, j, 1;
                Vector3f outCoords = H.inverse() * imCoords; // use inverse warping
				float x = outCoords(0) / outCoords(2);
                float y = outCoords(1) / outCoords(2);
				output(i, j, c) = interpolateLin(im, x, y, c, false);
			}
		}
	}

	return output;
}

// Rectify an image given two sets of points
// input: im is the input image to be rectified, im1Points and im2Points are n-by-2 matrices
// holding the (x,y) locations of n point correspondences from the two images
// output: the warped image
FloatImage rectifyImage(const FloatImage &im, const std::vector<std::vector<int>> im1Points, const std::vector<std::vector<int>> im2Points)
{
    Matrix3f H = computeHomography(im1Points, im2Points);
    return warpImage(im, H);
}

// bounding boxes

// FloatImage stitch(im1, im2, im1Points, im2Points)
// input: im1 and im2 are the images to be stitched together, im1Points and im2Points are
// n-by-2 matrices holding the (x,y) locations of n point correspondences
// output: the stitched panorama image