#include "homography.h"
#include "utils.h"
#include "math.h"
#include <iostream>
#include <array>
#include <numeric> // std::iota
#include <algorithm> // std::min
#include <float.h> // FLT_MAX
#include <iostream>
// #include <opencv2/core/mat.hpp>
// #include <opencv2/imgproc.hpp>

using namespace std;
using Vec2f = std::array<float, 2>;
// using namespace cv;

// ------- STEP 1 -------

// Implementing Harris Interest Point Detector to find all Harris corners
// in the input image; discards corners near the edge.
// RETURNS: Coordinates of the remaining corners & 2D array containing
// the h-value of every pixel.
void harris(const FloatImage im, int edge_discard) {
    assert(edge_discard >= 20);

    // Find harris corners
    vector<float> im_array = convert_im_type(im);
    
    // support for color channels?
    // may want to consider converting FloatImage to 2d
    vector<float> corners(im.width()*im.height()*im.depth(), 0);

    // ***check params on this***
    int blockSize = 7; int apertureSize = 5; float k = 0.05;
    // cv.cornerHarris(im_array, corners, blockSize, apertureSize, k, BORDER_DEFAULT);
    // peak_local_max: https://scikit-image.org/docs/dev/api/skimage.feature.html#skimage.feature.peak_local_max
}

// Convert FloatImage to single-channel floating-point image (cv::InputArray)
// cv:InputArray documentation: https://docs.opencv.org/3.4/d4/d32/classcv_1_1__InputArray.html#details
vector<float> convert_im_type(const FloatImage im) {

    vector<float> im_array(im.width()*im.height()*im.depth(), 0);
    
    for (int i = 0; i < im.width(); i++) {
        for (int j = 0; j < im.height(); j++) {
            for (int z = 0; z < im.depth(); z++) {
                im_array[z*im.width()*im.height()+j*im.width()+i] = im(i,j,z);
            }
        }
    }

    return im_array;

}

// *~~~* STEP 2: ADAPTIVE NON-MAXIMAL SUPPRESSION (ANMS) *~~~*

// Interest points are suppressed based on the corner strength;
// Only those that are a maximum in a neighborhood of radius r pixels are retained.
// Input: n (desired # of interest points), keypoints (from Harris Interest Point Detection/Step 1)
// Returns: Spatially diverse (non-suppressed) feature points that are evenly distributed throughout the img.

// information_source(s): https://www.geeksforgeeks.org/how-to-sort-a-vector-in-descending-order-using-stl-in-c/
// https://www.cplusplus.com/reference/cfloat/
// https://stackoverflow.com/questions/1577475/c-sorting-and-keeping-track-of-indexes
vector<Vec2f> suppress(int n, vector<Vec2f> keypoints) {

    assert(n <= keypoints.size());                                    // Ensure that you aren't asking for more than you have

    // Initialize vector of suppression radii (floats);
    // Start with the global maximum, which has an infinitely large suppression radii (AKA, none).
    vector<float> radii(keypoints.size());
    radii.push_back(FLT_MAX);                                         // FLT_MAX: maximum finite representable floating-point #
    
    // For every keypoint, obtain the min. distance to the previously visited keypoint(s).

    for (int i = 1; i < keypoints.size(); i++) {
        float minDistance = FLT_MAX;
        
        for (int j = 0; j < i; j++) {
            float xDiff = keypoints[j][0] - keypoints[i][0];                                            // x-coordinates
            float yDiff = keypoints[j][1] - keypoints[i][1];                                            // y-coordinates
            float minDistance = std::min((float)(sqrt(pow(xDiff,2) + pow(yDiff,2))), minDistance);      // update min. distance
        }
        
        radii.push_back(minDistance);
    }

    vector<int> indices(keypoints.size());
    iota(indices.begin(), indices.end(), 0); // accumulator => original indices

    // sort keypoint indices based on comparing their suppression radii (descending order of radii)
    // use stable_sort, and not sort, to avoid reordering indices when there are equal-value radii
    stable_sort(indices.begin(), indices.end(), [radii](int i1, int i2) {return radii[i1] > radii[i2];});
    
    vector<Vec2f> newKeypoints;
    for (int i = 0; i < n; i++) {
        newKeypoints.push_back(keypoints[indices[i]]);
    }

    return newKeypoints;
}

// *~~~* STEP 3: Feature Descriptor Extraction *~~~*

