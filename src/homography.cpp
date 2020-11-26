#include "homography.h"
#include "utils.h"
#include "math.h"
#include <iostream>
#include <array>
#include <numeric> // std::iota
#include <algorithm> // std::min
#include <float.h> // FLT_MAX
#include <iostream>
#include <Eigen/Dense>

using namespace std;
using namespace Eigen;
using Vec2f = std::array<float, 2>;

// // ------- STEP 1 -------

// STEP 1: extracts harris interest points
// INPUT: 
// - the original image
// - the # of levels in the gaussian pyramid
// - the gaussian pyramid itself
//
// OUTPUT: vector of float vectors storing possible interest points in the following format (corner strength, x, y, level, orientation)
vector<vector<float>> harris(const FloatImage im, int levels, vector<FloatImage> pyramid){
    vector<vector<float>> interestPoints;

    // initialize the orientation pyramid
    vector<FloatImage> orientationPyra;

    // get the spatially gradiated pyramid (using the sobel operator)
    for(int i = 0; i < levels; i++){
        vector<FloatImage> magOri = gradientMagnitude(pyramid[i], true);
        pyramid[i] = magOri[0];
        orientationPyra.push_back(magOri[1]);
    }

    // for every level in the pyramid, calculate the possible interest points
    for(int l = 0; l < levels; l++){
        // initialize a floatimage that stores corner strength
        FloatImage corners(pyramid[l].width(), pyramid[l].height(), pyramid[l].channels());

        // calculate and store corner values
        for(int y = 0; y < pyramid[l].height(); y++){
            for(int x = 0; x < pyramid[l].width(); x++){
                // create a 3x3 matrix to store the 3x3 matrix around each point
                Matrix3f H;
                H << pyramid[l].smartAccessor(x-1,y-1,0,true), pyramid[l].smartAccessor(x,y-1,0,true), pyramid[l].smartAccessor(x+1,y-1,0,true),
                    pyramid[l].smartAccessor(x-1,y,0,true), pyramid[l](x,y,0), pyramid[l].smartAccessor(x+1,y,0,true), 
                    pyramid[l].smartAccessor(x-1,y+1,0,true), pyramid[l].smartAccessor(x,y+1,0,true), pyramid[l].smartAccessor(x+1,y+1,0,true);

                // finally calculate the corner strength
                corners(x,y,0) = H.determinant()/H.trace();
            }
        }
        /////////////////////////////////////
        // maybe also include the above-threshold points?
        /////////////////////////////////////

        // for every corner point, compare with every neighbor to determine if it is a local maximum,
        //      and if so, record as a potential interest point
        for(int y = 0; y < pyramid[l].height(); y++){
            for(int x = 0; x < pyramid[l].width(); x++){
                if(
                    corners(x,y,0) > corners.smartAccessor(x-1,y-1,0,true) &&
                    corners(x,y,0) > corners.smartAccessor(x,y-1,0,true) &&
                    corners(x,y,0) > corners.smartAccessor(x+1,y-1,0,true) &&
                    corners(x,y,0) > corners.smartAccessor(x-1,y,0,true) &&
                    corners(x,y,0) > corners.smartAccessor(x+1,y,0,true) &&
                    corners(x,y,0) > corners.smartAccessor(x-1,y+1,0,true) &&
                    corners(x,y,0) > corners.smartAccessor(x,y+1,0,true) &&
                    corners(x,y,0) > corners.smartAccessor(x-1,y+1,0,true)
                ){
                    // record interest points in format of (corner strength, x, y, level, orientation)
                    vector<float> interestPoint = {corners(x,y,0), (float) x, (float) y, (float) l, orientationPyra[l](x,y,0)};
                    interestPoints.push_back(interestPoint);
                }
            }
        }
    }
    // sort the interest points by corner strength so they can be effectively suppressed in the next step
    sort(interestPoints.begin(), interestPoints.end(), [interestPoints](int i1, int i2) {return interestPoints[i1][0] > interestPoints[i2][0];});
    return interestPoints;
}

// *~~~* STEP 2: ADAPTIVE NON-MAXIMAL SUPPRESSION (ANMS) *~~~*

// Interest points are suppressed based on the corner strength;
// Only those that are a maximum in a neighborhood of radius r pixels are retained.
// Input: n (desired # of interest points), keypoints (from Harris Interest Point Detection/Step 1)
// Returns: Spatially diverse (non-suppressed) feature points that are evenly distributed throughout the img.

// information_source(s): https://www.geeksforgeeks.org/how-to-sort-a-vector-in-descending-order-using-stl-in-c/
// https://www.cplusplus.com/reference/cfloat/
// https://stackoverflow.com/questions/1577475/c-sorting-and-keeping-track-of-indexes
vector<vector<float>> suppress(int n, vector<vector<float>> keypoints) {

    assert(n <= keypoints.size());                                    // Ensure that you aren't asking for more than you have

    // Initialize vector of suppression radii (floats);
    // Start with the global maximum, which has an infinitely large suppression radii (AKA, none).
    vector<float> radii(keypoints.size());
    radii.push_back(FLT_MAX);                                         // FLT_MAX: maximum finite representable floating-point #
    
    // For every keypoint, obtain the min. distance to the previously visited keypoint(s).

    for (int i = 1; i < keypoints.size(); i++) {
        float minDistance = FLT_MAX;
        
        for (int j = 0; j < i; j++) {
            // get the x and y coordinates, but also adjust the interest point coordinates by their level
            float xDiff = keypoints[j][1]*pow(2,keypoints[j][3]+1) - keypoints[i][1]*pow(2,keypoints[i][3]+1);
            float yDiff = keypoints[j][2]*pow(2,keypoints[j][3]+1) - keypoints[i][2]*pow(2,keypoints[i][3]+1);
            float minDistance = std::min((float)(sqrt(pow(xDiff,2) + pow(yDiff,2))), minDistance);      // update min. distance
        }
        
        radii.push_back(minDistance);
    }

    // Initialize original indices
    vector<int> indices(keypoints.size());
    iota(indices.begin(), indices.end(), 0); // accumulator => original indices

    // sort keypoint indices based on comparing their suppression radii (descending order of radii)
    // use stable_sort, and not sort, to avoid reordering indices when there are equal-value radii
    stable_sort(indices.begin(), indices.end(), [radii](int i1, int i2) {return radii[i1] > radii[i2];});
    
    vector<vector<float>> newKeypoints;
    for (int i = 0; i < n; i++) {
        newKeypoints.push_back(keypoints[indices[i]]);
    }

    return newKeypoints;
}


// *~~~* STEP 3: Feature Descriptor Extraction *~~~*
// INPUT:
// - the original image
// - the gaussian pyramid
// - the vector of keypoints
//
// OUTPUT:
// - a vector of 64-dimensional descriptors
vector<vector<float>> featureDescriptors(const FloatImage im, vector<FloatImage> pyramid, vector<vector<float>> keypoints)
{   
    vector<vector<float>> descriptors;

    // adjust the Gaussian pyramid so it has the original image as the first layer for calculation purposes
    vector<FloatImage> newPyramid;
    float weight_init[3] = {0.299, 0.587, 0.114};
    newPyramid.push_back(color2gray(im, weight_init));
    newPyramid.insert(newPyramid.end(), pyramid.begin(), pyramid.end());

    //////////////////////////////////////////////////////////////////////////
    // Should probably store sobel + gaussian pyramid on different function 
    // so calculation doesn't need to be repeated
    //////////////////////////////////////////////////////////////////////////

    // initialize the orientation pyramid
    vector<FloatImage> orientationPyra;

    // get the spatially gradiated pyramid again (using the sobel operator)
    for (int i = 0; i < newPyramid.size(); i++){
        vector<FloatImage> magOri = gradientMagnitude(newPyramid[i], true);
        newPyramid[i] = magOri[0];
        orientationPyra.push_back(magOri[1]);
    }

    // for every keypoint, generate descriptors
    for (int i = 0; i < keypoints.size(); i++){
        // calculate the values of the 8x8 patches by calculating the mean of the patch

        // get the center keypoint and adjust the keypoint's coordinates to a higher layer to avoid anti-aliasing 
        int centerX = keypoints[i][1] * 2;
        int centerY = keypoints[i][2] * 2;
        int layer = keypoints[i][3];
        float angle = keypoints[i][4];
        float sine = sin(angle);
        float cosine = cos(angle);

        // initialize the patches
        vector<float> patches(64);

        // get patch values
        for (int j = 0; j < 8; j++){
            for (int k = 0; k < 8; k++){
                // initialize a patch vector
                vector<float> p(25);

                for (int m = 0; m < 5; m++){
                    for (int n = 0; n < 5; n++){
                        // calculate the adjusted coordinates accounting for patches
                        int patchX = centerX -16 + j*4 + m;
                        int patchY = centerY -16 + k*4 + n;

                        // calculate the rotated coordinate
                        int rotateX = round(patchX * cosine - patchY * sine);
                        int rotateY = round(patchX * sine + patchY * cosine);
                        p[m+5*n] = newPyramid[layer].smartAccessor(rotateX, rotateY, 0);
                    }

                }
                // average out the values
                patches[j + 8*k] = std::accumulate(p.begin(), p.end(), 0) / 25;
            }
        }
        // calculate the mean and the standard deviation
        float mean = std::accumulate(patches.begin(), patches.end(), 0) / 64;
        float variance = 0;
        for(int a = 0; a < 64; a++){
            variance = variance + pow(patches[a] - mean,2);
        }
        variance = variance / 64;
        float sd = sqrt(variance);

        // Adjust the mean and standard devation to 0 and 1 respectively.
        // Method learned from https://stats.stackexchange.com/questions/46429/transform-data-to-desired-mean-and-standard-deviation
        for(int b = 0; b < 64; b++){
            patches[b] = 0 + (patches[b] - mean) * 1/sd;
        }

        // Perform a Haar wavelet transformation.
        // Method learned from https://people.sc.fsu.edu/~jburkardt/c_src/haar/haar.html 
        vector<float> temp = patches;
        int c = 8;
        
        while (1 < c){
            c = c /2;
            
            for (int d = 0; d < 8; d++){
                for (int e = 0; e < c; e++){
                    temp[e + 8*d] = (patches[2*e + 8*d] + patches[2*e+1+8*d]) / sqrt(2);
                    temp[c + e+8*d] = (patches[2*e + 8*d] - patches[2*e+1+8*d]) / sqrt(2);
                }
            }
            
            for (int d = 0; d < 8; d++){
                for (int e = 0; e < 2*c; e++){
                    patches[e + 8*d] = temp[e + 8*d];
                }
            }
        }
        
        c = 8;
        
        while (1 < c) {
            c = c/2;
            
            for (int d = 0; d < 8; d++){
                for (int e = 0; e < c; e++){
                    temp[e + 8*d] = (patches[e + 16*d] + patches[e+8*(2*d+1)]) / sqrt(2);
                    temp[e + 8*(c+d)] = (patches[e + 16*d] - patches[e+8*(2*d+1)]) / sqrt(2);
                }
            }

            for (int d = 0; d < 2*c; d++){
                for (int e = 0; e < 8; e++){
                    patches[e + 8*d] = temp[e + 8*d];
                }
            }
        }
        // add the 64-dimensional descriptor
        descriptors.push_back(patches);
    }
}

// calculates a grayscaled gaussian pyramid for convenience in more complex functions
vector<FloatImage> grayscalePyramid(const FloatImage &im, int levels)
{
    // harris interest points are typically grayscaled so we'll grayscale here too
    // use assignment 2's default weights for grayscaling
    float weight_init[3] = {0.299, 0.587, 0.114};
    FloatImage grayed = color2gray(im, weight_init);

    // get a gaussian pyramid using the grayscaled image
    vector<FloatImage> pyramid = gaussianPyramid(grayed, 3, 3, true, levels);

    return pyramid;
}

// creates a gaussian pyramid
vector<FloatImage> gaussianPyramid(const FloatImage &im, float sigma, float truncate, bool clamp, int level)
{
    vector<FloatImage> pyramid;
    // add the first image into the pyramid
    FloatImage currentLevel(im);


    // for each level in the pyramid, blur and reduce
    for(int i = 0; i < level; i++){
        // blur the image
        FloatImage blurImage = gaussianBlur_seperable(currentLevel, sigma, truncate, clamp);

        // reduce the scale
        currentLevel = FloatImage(blurImage.width()/2, blurImage.height()/2, blurImage.channels());

        for (int x = 0; x < blurImage.width()/2; x++){
            for (int y = 0; y < blurImage.height()/2; y++){
                for (int z = 0; z < blurImage.channels()/2; z++){
                    // get the doubled coordinates for simplicity
                    currentLevel(x,y,z) = blurImage(min(x*2, blurImage.width()-1),min(y*2,blurImage.height()-1),z);
                }
            }
        }

        // add the blurred and reduced image to the pyramid
        pyramid.push_back(currentLevel);
    }
}


// Returns indices of matches between keypoints1 & keypoints2,
// sorted in increasing order by corresponding SSD (Sum of Squared Distance).
vector<vector<int>> featureMatching(const FloatImage im1, const FloatImage im2, vector<vector<float>> keypoints1, 
    vector<vector<float>> keypoints2, vector<vector<float>> descriptors1, vector<vector<float>> descriptors2) {

    assert((keypoints1.size() == descriptors1.size()) && (keypoints2.size() == descriptors2.size()) && 
        (keypoints1.size() == keypoints2.size()));


    // Compile indices & distances of tentative matches between keypoints
    vector<vector<int>> matchIndices;
    vector<float> matchDistances;
    
    // Brute force
    for (int i = 0; i < keypoints1.size(); i++) {
        
        float smallestDistance = FLT_MAX;
        
        // Lowe's ratio test? Consider thresholding (recommended starter th=0.5)
        // Lowering this threshold will improve the quality of matches but decrease the overall amount. Optimize for this tradeoff?
        for (int j = 0; j < keypoints2.size(); j++) {
            float ssd = computeSumSquaredDist(descriptors1[i], descriptors2[j]);
            if (ssd < smallestDistance) {
                smallestDistance = ssd;
                vector<int> indices{ i, j };
                matchIndices.push_back(indices);
                matchDistances.push_back(ssd);
            }
        }
    }

    // sort matchIndices based on increasing order of their corresponding matchDistances
    stable_sort(matchIndices.begin(), matchIndices.end(), [matchDistances](float dist1, float dist2) {return matchDistances[dist1] < matchDistances[dist2];});

    return matchIndices;

}

// SSD between two patches (keypoint descriptors)
float computeSumSquaredDist(vector<float> patch1, vector<float> patch2) {
    float sum = 0.0;
    for (int i = 0; i < patch1.size(); i++) {
        sum += pow(patch1[i] - patch2[i], 2);
    }
    return sum;
}


/**********************************************************************************
 //                 GRAYSCALE FUNCTION    *(from assignment 2)              //
 **********************************************************************************/

FloatImage color2gray(const FloatImage &im, const vector<float> &weights)
{
	if ((int) weights.size() != im.channels())
		throw MismatchedDimensionsException();

	// set the dimensions of the float image to be width x height x 1
	FloatImage output = FloatImage(im.width(), im.height(), 1); 

	// iterate through every xy position and average out the channels using weights
	for (int y = 0; y < im.height(); ++y)
		for (int x = 0; x < im.width(); ++x)
			output(x,y,0) = weights[0]*im(x,y,0) + weights[1]*im(x,y,1) + weights[2]*im(x,y,2);

	// Convert to grayscale

	return output;
}

/**********************************************************************************
 //                 SOBEL FUNCTION    *(from assignment 4 mostly)              //
 **********************************************************************************/
// uses a Sobel kernel to compute the horizontal and vertical
// components of the gradient of an image and returns the gradient magnitude.
vector<FloatImage> gradientMagnitude(const FloatImage &im, bool clamp)
{
	FloatImage mag(im);
    FloatImage orientation(im);
	Filter sobelX(3,3); Filter sobelY(3,3);

	// sobel filtering in x direction
	sobelX(0,0) = -1; sobelX(0,1) = -2; sobelX(0,2) = -1;
	sobelX(2,0) = 1; sobelX(2,1) = 2; sobelX(2,2) = 1;

	// sobel filtering in y direction
	sobelY(0,0) = -1; sobelY(1,0) = -2; sobelY(2,0) = -1;
	sobelY(0,2) = 1; sobelY(1,2) = 2; sobelY(2,2) = 1;

	// compute squared magnitude
	FloatImage xMag = sobelX.Convolve(im,clamp);
	FloatImage yMag = sobelY.Convolve(im,clamp);

	// for each pixel, add the x and y magnitudes
	for(int x = 0; x < im.width(); ++x)
		for(int y = 0; y < im.height(); ++y)
			for(int z = 0; z < im.channels(); ++z){
				mag(x,y,z) = sqrt(pow(xMag(x,y,z),2) + pow(yMag(x,y,z),2));
                orientation(x,y,z) = atan2f(yMag(x,y,z), xMag(x,y,z));
			}

    vector<FloatImage> magOri;
    magOri.push_back(mag);
    magOri.push_back(orientation);

	return magOri;
}

/**********************************************************************************
 //                 GAUSSIAN FUNCTIONS    *(from assignment 4 mostly)              //
 **********************************************************************************/



// create a vector containing the normalized values in a 1D Gaussian filter
vector<float> gauss1DFilterValues(float sigma, float truncate)
{
	float sd = sigma*truncate;	
	float lim = ceil(sd);

	// calculate the size of the filter
	vector<float> gauss1D(2*lim+1, 0);

	// compute the un-normalized value of the gaussian
	float sum = 0;
	for(int i = 0; i < 2*lim+1; ++i){
		gauss1D[i] = exp(-pow(-lim+i,2)/(2*pow(sd,2)));
		sum += gauss1D[i];
	}

	// normalize
	for(int i = 0; i < 2*lim+1; ++i){
		gauss1D[i] = gauss1D[i]/sum;
	}


	return gauss1D;//  CHANGEME
}

// Use principles of seperabiltity to blur an image using 2 1D Gaussian Filters
FloatImage gaussianBlur_seperable(const FloatImage &im, float sigma, float truncate, bool clamp)
{
	// blur using 2, 1D filters in the x and y directions
	vector<float> gaussV = gauss1DFilterValues(sigma, truncate);
	Filter gaussXD(gaussV, 2*ceil(sigma*truncate)+1, 1);
	Filter gaussYD(gaussV, 1, 2*ceil(sigma*truncate)+1);

	FloatImage seperable = gaussXD.Convolve(im, clamp);	
	return gaussYD.Convolve(seperable, clamp);//  CHANGEME
}




/**************************************************************
 //                 FILTER CLASS FUNCTIONS                  //
 *************************************************************/


// write a convolution function for the filter class
FloatImage Filter::Convolve(const FloatImage &im, bool clamp) const
{
	FloatImage imFilter(im.width(), im.height(), im.channels());

	// implement convultion
	// pass through every pixel and channel
	for(int x = 0; x < im.width(); ++x)
		for(int y = 0; y < im.height(); ++y)
			for(int z = 0; z < im.channels(); ++z){
				// convolve with the kernel
				for(int xK = 0; xK < width; ++xK)
					for(int yK = 0; yK < height; ++yK){
						imFilter(x,y,z) += operator()(xK,yK) * im.smartAccessor(x+width/2-xK,y+height/2-yK,z,clamp);
					}
			}

	// Hint: use use Filter::operator()(x, y) to access (x,y) kernel location

	return imFilter;
}


// Create an image of 0's with a value of 1 in the middle. This function
// can be used to test that you have properly set the kernel values in your
// Filter object. Make sure to set k to be larger than the size of your kernel
FloatImage impulseImg(const int &k)
{
	// initlize a kxkx1 image of all 0's
	FloatImage impulse(k, k, 1);

	// set the center pixel to have intensity 1
	int center = k / 2;
	impulse(center, center, 0) = 1;

	return impulse;
}

Filter::Filter(const vector<float> &fData, const int &fWidth, const int &fHeight)
{
	// TODO: check that width*height = length of filterVals and that width and height are odd

	kernel = fData;
	width = fWidth;
	height = fHeight;

}

Filter::Filter(const int &fWidth, const int &fHeight)
{
	width = fWidth;
	height = fHeight;
	kernel = std::vector<float>(width * height, 0);
}

const float &Filter::operator()(int x, int y) const
{
	if (x < 0 || x >= width)
		throw OutOfBoundsException();
	if (y < 0 || y >= height)
		throw OutOfBoundsException();

	return kernel[x + y * width];
}

float &Filter::operator()(int x, int y)
{
	if (x < 0 || x >= width)
		throw OutOfBoundsException();
	if (y < 0 || y >= height)
		throw OutOfBoundsException();

	return kernel[x + y * width];
}
Filter::~Filter() {}