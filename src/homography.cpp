#include "homography.h"
#include "mosaic.h"
#include "utils.h"
#include "math.h"
#include <iostream>
#include <array>
#include <numeric> // std::iota
#include <algorithm> // std::min
#include <float.h> // FLT_MAX
#include <iostream>
#include <Eigen/Dense>
#include <opencv2/opencv.hpp>
#include <opencv2/highgui.hpp>

using namespace std;
using namespace Eigen;
using namespace cv;
using Vec2f = std::array<float, 2>;

// // ------- STEP 1 -------

// STEP 1: extracts harris interest points
// INPUT: 
// - the original image
// - the # of levels in the gaussian pyramid
// - the gaussian pyramid itself
//
// OUTPUT: vector of float vectors storing possible interest points in the following format (corner strength, x, y, level, orientation)
vector<vector<float>> harris(const FloatImage &im, int levels, vector<FloatImage> pyramid){
    vector<vector<float>> interestPoints;

    // initialize the orientation pyramid
    vector<FloatImage> orientationPyra;

    vector<vector<FloatImage>> harrisPyra;

    // Get the spatially gradiated pyramid (using the Sobel operator)
    for (int i = 0; i < levels; i++) {
        vector<FloatImage> magOri = gradientMagnitude(pyramid[i], true);
        harrisPyra.push_back({magOri[0] * magOri[0], magOri[0] * magOri[1], magOri[1] * magOri[1]});
        orientationPyra.push_back(magOri[3]); // orientation
    }

    // for every level in the pyramid, calculate the possible interest points
    for (int l = 0; l < levels; l++) {
        
        vector<FloatImage> currentLevel = harrisPyra[l];
        
        FloatImage gradientXX = currentLevel[0]; FloatImage gradientXY = currentLevel[1]; FloatImage gradientYY = currentLevel[2];
        
        // initialize a one-dimensional FloatImage that stores corner strength
        FloatImage corners(gradientXX.width(), gradientXX.height(), 1);

        // calculate and store corner values
        for (int y = 0; y < gradientXX.height(); y++) {
            for (int x = 0; x < gradientXX.width(); x++) {

                // sum of intensity values within 3x3 window around current (x,y) location

                float sumXX = 0.0; float sumXY = 0.0; float sumYY = 0.0;

                for (int j = y-1; j <= y+1; j++) {
                    for (int i = x-1; i <= x+1; i++) {
                        sumXX += gradientXX.smartAccessor(i,j,0,true);
                        sumXY += gradientXY.smartAccessor(i,j,0,true);
                        sumYY += gradientYY.smartAccessor(i,j,0,true);
                    }
                }

                float determinant = (sumXX * sumYY) - pow(sumXY, 2);
                float trace = sumXX + sumYY;

                corners(x,y,0) = determinant - 0.04*pow(trace, 2); // corner strength formula
            }
        }

        /////////////////////////////////////
        // maybe also include the above-threshold points?
        /////////////////////////////////////

        // for every corner point, compare with every neighbor to determine if it is a local maximum,
        //      and if so, record as a potential interest point
        for (int y = 0; y < gradientXX.height(); y++){
            for (int x = 0; x < gradientXX.width(); x++){
                
                // what about x+1,y+1?
                if (
                    corners(x,y,0) > corners.smartAccessor(x-1, y-1, 0, true) &&
                    corners(x,y,0) > corners.smartAccessor(x, y-1, 0, true) &&
                    corners(x,y,0) > corners.smartAccessor(x+1, y-1, 0, true) &&
                    corners(x,y,0) > corners.smartAccessor(x-1, y, 0, true) &&
                    corners(x,y,0) > corners.smartAccessor(x+1, y, 0, true) &&
                    corners(x,y,0) > corners.smartAccessor(x-1, y+1, 0, true) &&
                    corners(x,y,0) > corners.smartAccessor(x, y+1, 0, true) &&
                    corners(x,y,0) > corners.smartAccessor(x+1, y+1, 0, true) // fixt
                ) {
                    // record interest points in format of (corner strength, x, y, level, orientation)
                    vector<float> interestPoint = { corners(x,y,0), (float) x, (float) y, (float) l, orientationPyra[l](x,y,0) };
                    interestPoints.push_back(interestPoint);
                }
            }
        }
    }

    // sort the interest points by corner strength so they can be effectively suppressed in the next step
    // descending order of corner strength
    sort(interestPoints.begin(), interestPoints.end(), [](vector<float> i1, vector<float> i2) {return i1[0] > i2[0];});
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
    cout << keypoints.size() << endl;
    assert(n <= (int) keypoints.size());                                    // Ensure that you aren't asking for more than you have

    // Initialize vector of suppression radii (floats);
    // Start with the global maximum, which has an infinitely large suppression radii (AKA, none).
    vector<float> radii(keypoints.size());
    radii.push_back(FLT_MAX);                                         // FLT_MAX: maximum finite representable floating-point #
    
    // For every keypoint, obtain the min. distance to the previously visited keypoint(s).

    for (int i = 1; i < (int) keypoints.size(); i++) {
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
// - a vector of 64-dimensional descriptors in order of the keypoints found
vector<vector<float>> featureDescriptors(const FloatImage &im, vector<FloatImage> pyramid, vector<vector<float>> keypoints)
{   
    vector<vector<float>> descriptors;

    // adjust the Gaussian pyramid so it has the original image as the first layer for calculation purposes
    vector<FloatImage> newPyramid;
    vector<float> weight_init = {0.299, 0.587, 0.114};
    newPyramid.push_back(color2gray(im, weight_init));
    newPyramid.insert(newPyramid.end(), pyramid.begin(), pyramid.end());

    //////////////////////////////////////////////////////////////////////////
    // Should probably store sobel + gaussian pyramid on different function 
    // so calculation doesn't need to be repeated
    //////////////////////////////////////////////////////////////////////////

    // for every keypoint, generate descriptors
    for (int i = 0; i < (int) keypoints.size(); i++){
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
                        p[m+5*n] = newPyramid[layer].smartAccessor(rotateX, rotateY, 0, true);
                    }

                }
                // average out the values
                patches[j + 8*k] = std::accumulate(p.begin(), p.end(), (float)0) / 25;
            }
        }
        // cout << "{";
        // for(int z = 0; z < patches.size(); z++){
        //     cout << patches[z] << ",";
        // }
        // cout<<"}" << endl;
        // // calculate the mean and the standard deviation
        float mean = std::accumulate(patches.begin(), patches.end(), (float)0) / 64;
        float variance = 0;
        for(int a = 0; a < 64; a++){
            variance = variance + pow(patches[a] - mean,2);
        }
        variance = variance / 64.f;
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
            
            for (int d = 0; d < c; d++){
                for (int e = 0; e < 8; e++){
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
    return descriptors;
}

// calculates a grayscaled gaussian pyramid for convenience in more complex functions
vector<FloatImage> grayscalePyramid(const FloatImage &im, int levels)
{
    // Harris interest points are typically grayscaled so we'll grayscale here too
    // use assignment 2's default weights for grayscaling
    vector<float> weight_init = {0.299, 0.587, 0.114};
    FloatImage grayed = color2gray(im, weight_init);

    // get a gaussian pyramid using the grayscaled image
    vector<FloatImage> pyramid = gaussianPyramid(grayed, 1, 3, true, levels);

    return pyramid;
}

// Creates a Gaussian Pyramid where the first layer is the original image,
// and each subsequent layer is the reduced form of the previous layer.
vector<FloatImage> gaussianPyramid(const FloatImage &im, float sigma, float truncate, bool clamp, int level)
{
    vector<FloatImage> pyramid;

    FloatImage currentLevel(im);

    // For each level in the pyramid, blur and reduce
    for(int i = 0; i < level; i++) {
        // blur the image
        FloatImage blurImage = gaussianBlur_seperable(currentLevel, sigma, truncate, clamp);
        // string hello = "/output/gausstest";
        // string hello1 = to_string(i);
        // string hello2 = ".jpg";
        // string &total = DATA_DIR + hello + hello1 + hello2;
        // blurImage.write(total);

        // reduce the scale
        currentLevel = FloatImage(blurImage.width()/2, blurImage.height()/2, blurImage.channels());

        for (int x = 0; x < currentLevel.width(); x++){
            for (int y = 0; y < currentLevel.height(); y++){
                for (int z = 0; z < currentLevel.channels(); z++){
                    // get the doubled coordinates for simplicity
                    currentLevel(x,y,z) = blurImage(min(x*2, blurImage.width()-1), min(y*2,blurImage.height()-1), z);
                }
            }
        }

        // add the blurred and reduced image to the pyramid
        pyramid.push_back(currentLevel);
    }

    return pyramid;
}


// Returns indices of matches between keypoints1 & keypoints2,
// sorted in increasing order by corresponding SSD (Sum of Squared Distance).
vector<vector<int>> featureMatching(const FloatImage &im1, const FloatImage &im2, vector<vector<float>> keypoints1, 
    vector<vector<float>> keypoints2, vector<vector<float>> descriptors1, vector<vector<float>> descriptors2) {

    assert((keypoints1.size() == descriptors1.size()) && (keypoints2.size() == descriptors2.size()) && 
        (keypoints1.size() == keypoints2.size()));


    // Compile indices & distances of tentative matches between keypoints
    vector<vector<int>> matchIndices;
    vector<tuple<vector<int>, float>> matchIndexDist;
    
    // Brute force
    for (int i = 0; i < (int) keypoints1.size(); i++) {
        
        float smallestDistance = FLT_MAX;
        float secondSmallest = FLT_MAX;
        float ssd = FLT_MAX;
        vector<int> indices = {0, 0};
        bool validSSD = false;
        
        // Lowe's ratio test? Consider thresholding (recommended starter th=0.5)
        // Lowering this threshold will improve the quality of matches but decrease the overall amount. Optimize for this tradeoff?
        for (int j = 0; j < (int) keypoints2.size(); j++) {
            
            ssd = computeSumSquaredDist(descriptors1[i], descriptors2[j]);

            if (ssd < smallestDistance) {
                secondSmallest = smallestDistance;
                smallestDistance = ssd;
                // cout << i << "," << j << endl;
                indices[0]=i; indices[1]=j;
                validSSD = true;
                // cout <<indices[0] << "," << indices[1] << endl;
            }
            else if (ssd < secondSmallest && ssd != smallestDistance) {
                secondSmallest = ssd;
            }
        }

        // utilize lowe's method of determining better quality matches
        float ratio = smallestDistance / secondSmallest;

        if (ratio >= 0.95 && validSSD) {
            // cout << ratio << ": " << indices[0] << "," << indices[1] << endl;
            // cout <<indices[0] << "," << indices[1] << endl;
            matchIndexDist.push_back(make_tuple(indices, ssd));
        }
    }

    // sort matchIndices based on increasing order of their corresponding matchDistances
    stable_sort(matchIndexDist.begin(), matchIndexDist.end(), [](tuple<vector<int>, float> dist1, tuple<vector<int>, float> dist2) {return get<1>(dist1) < get<1>(dist2);});

    // extract the sorted matching indicies
    for(int k = 0; k < (int) matchIndexDist.size(); k++) {
        matchIndices.push_back(get<0>(matchIndexDist[k]));
    }
    return matchIndices;

}

// SSD between two patches (keypoint descriptors)
float computeSumSquaredDist(vector<float> patch1, vector<float> patch2) {
    float sum = 0.0;
    for (int i = 0; i < (int) patch1.size(); i++) {
        sum += pow(patch1[i] - patch2[i], 2);
    }
    return sum;
}

// RANSAC: RAndom SAmple Consensus
// Filter matches by randomly selecting 4 feature pairs (matches) and computing a homography from them
// Then, use this homography to transform all the MATCHED keypoints, and see if this transformation is valid
// Count the number of inliers from the transformation
// The homography with the max. # of inliers is selected; non-adhering points (outliers) are rejected
// 
// epsilon = limit for ssd
// thres = limit for # of inliners
Matrix3f myRANSAC(const FloatImage &im, vector<vector<float>> keypoints1, vector<vector<float>> keypoints2, vector<vector<int>> matchIndices, 
    int iterations, float epsilon, float thres) {
    
    assert(keypoints1.size() == keypoints2.size());
    
    vector<vector<float>> mostInliers;
    
    int maxInliner = 0;
    Matrix3f bestHomography;
    
    for (int i = 0; i < iterations; i++) {
        // Select four feature pairs (at random)
        vector<int> match1 = matchIndices[rand() % matchIndices.size()];
        vector<int> match2 = matchIndices[rand() % matchIndices.size()];
        vector<int> match3 = matchIndices[rand() % matchIndices.size()];
        vector<int> match4 = matchIndices[rand() % matchIndices.size()];

        // Compute homography matrix H (exact, no estimate)
        Matrix3f homography = compute4MatchHomography(keypoints1, keypoints2, match1, match2, match3, match4);
       
        // we also want to use H to get Hp via another perspectiveTransform on keypoints1

        // Compute inliers where SSD(p'_i, Hp_i) < epsilon (=1)
        vector<vector<float>> inliers;
        
        float inLinerCount = 0;
        // calculate the total ssd if using the homography matrix
        for (int j = 0; j < (int) matchIndices.size(); j++) {
            int index1 = matchIndices[j][0];
            int index2 = matchIndices[j][1];
            // cout << index1 << "," << index2 << endl;

            // extract the xy coordinates of pixel 2
            int pixel2X = (int) keypoints2[index2][1] * pow(2, keypoints2[index2][3] + 1); 
            int pixel2Y = (int) keypoints2[index2][1] * pow(2, keypoints2[index2][3] + 1); 

            // compute the transformed pixel location
            MatrixXf pixel1(3,1); 
            pixel1(0,0) = keypoints1[index1][1] * pow(2, keypoints1[index1][3] + 1); 
            pixel1(1,0) = keypoints1[index1][2] * pow(2, keypoints1[index1][3] + 1); 
            pixel1(2,0) = 1;

            MatrixXf transPixel = homography*pixel1;

            int newX = (int) round(transPixel(0,0)/transPixel(2,0));
            int newY = (int) round(transPixel(1,0)/transPixel(2,0));
            
            // sum the rgb differences
            float ssd = 0.0;
            for (int k = 0; k < im.channels(); k++) {
                ssd += pow(im.smartAccessor(pixel2X, pixel2Y, k, true)- im.smartAccessor(newX, newY, k, true),2);
            }
            // ssd doesn't exceed epsilon, increment inliner count
            if (ssd < epsilon) {
                // cout << ssd << endl;
                inLinerCount++;
            }
        }
        // if the current number of inliners exceeds the threshold,
        // return the current homography matrix
        if (thres <= inLinerCount/(float) matchIndices.size()) {
            cout << i << endl;
            cout << "ratio is: " << inLinerCount/(float) matchIndices.size() << endl;
            return homography;
        }
        // if not, simply record it as the best homography matrix so far
        else if (maxInliner < inLinerCount){
            maxInliner = (int) inLinerCount;
            bestHomography = homography;
        }
    }
    // if none of homography matricies exceeded the threshold, just return the least worse one
    cout << iterations << endl;
    return bestHomography;
}

// basically raw implementation of opencv perspectiveTransform
Matrix3f compute4MatchHomography(vector<vector<float>> keypoints1, vector<vector<float>> keypoints2, vector<int> match1, vector<int> match2, vector<int> match3, vector<int> match4) {
    MatrixXf known(8,9);
    vector<vector<int>> matches(4);
    matches[0] = match1;matches[1] = match2;matches[2] = match3;matches[3] = match4;

    // fill in the known values and adjust the coordinates as they are based on scaled coordinates

    // explanation obtained from original teaching material of project

    // 1st row [-x1, -y1, -1, 0, 0, 0, x1*x1', y1*x1', x1']
    known(0,0) = -keypoints1[match1[0]][1] * pow(2, keypoints1[match1[0]][3] + 1);
    known(0,1) = -keypoints1[match1[0]][2] * pow(2, keypoints1[match1[0]][3] + 1);
    known(0,2) = -1;known(0,3) = 0; known(0,4) = 0;known(0,5) = 0;
    known(0,6) = keypoints1[match1[0]][1] * pow(2, keypoints1[match1[0]][3] + 1) *
                    keypoints2[match1[1]][1] * pow(2, keypoints2[match1[1]][3] + 1);
    known(0,7) = keypoints1[match1[0]][2] * pow(2, keypoints1[match1[0]][3] + 1) *
                    keypoints2[match1[1]][1] * pow(2, keypoints2[match1[1]][3] + 1);
    known(0,8) = keypoints2[match1[1]][1] * pow(2, keypoints2[match1[1]][3] + 1);

    // 2nd row [0, 0, 0, -x1, -y1, -1, x1*y1', y1*y1', y1']
    known(1,0) = 0; known(1,1) = 0; known(1,2) = 0;
    known(1,3) = -keypoints1[match1[0]][1] * pow(2, keypoints1[match1[0]][3] + 1);
    known(1,4) = -keypoints1[match1[0]][2] * pow(2, keypoints1[match1[0]][3] + 1);
    known(1,5) = -1;
    known(1,6) = keypoints1[match1[0]][1] * pow(2, keypoints1[match1[0]][3] + 1) *
                    keypoints2[match1[1]][2] * pow(2, keypoints2[match1[1]][3] + 1);
    known(1,7) = keypoints1[match1[0]][2] * pow(2, keypoints1[match1[0]][3] + 1) *
                    keypoints2[match1[1]][2] * pow(2, keypoints2[match1[1]][3] + 1);
    known(1,8) = keypoints2[match1[1]][2] * pow(2, keypoints2[match1[1]][3] + 1);

    // 3rd row [-x2, -y2, -1, 0, 0, 0, x2*x2', y2*x2', x2']
    known(2,0) = -keypoints1[match2[0]][1] * pow(2, keypoints1[match2[0]][3] + 1);
    known(2,1) = -keypoints1[match2[0]][2] * pow(2, keypoints1[match2[0]][3] + 1);
    known(2,2) = -1;known(2,3) = 0; known(2,4) = 0;known(2,5) = 0;
    known(2,6) = keypoints1[match2[0]][1] * pow(2, keypoints1[match2[0]][3] + 1) *
                    keypoints2[match2[1]][1] * pow(2, keypoints2[match2[1]][3] + 1);
    known(2,7) = keypoints1[match2[0]][2] * pow(2, keypoints1[match2[0]][3] + 1) *
                    keypoints2[match2[1]][1] * pow(2, keypoints2[match2[1]][3] + 1);
    known(2,8) = keypoints2[match2[1]][1] * pow(2, keypoints2[match2[1]][3] + 1);

    // 4th row [0, 0, 0, -x2, -y2, -1, x2*y2', y2*y2', y2']
    known(3,0) = 0; known(3,1) = 0; known(3,2) = 0;
    known(3,3) = -keypoints1[match2[0]][1] * pow(2, keypoints1[match2[0]][3] + 1);
    known(3,4) = -keypoints1[match2[0]][2] * pow(2, keypoints1[match2[0]][3] + 1);
    known(3,5) = -1;
    known(3,6) = keypoints1[match2[0]][1] * pow(2, keypoints1[match2[0]][3] + 1) *
                    keypoints2[match2[1]][2] * pow(2, keypoints2[match2[1]][3] + 1);
    known(3,7) = keypoints1[match2[0]][2] * pow(2, keypoints1[match2[0]][3] + 1) *
                    keypoints2[match2[1]][2] * pow(2, keypoints2[match2[1]][3] + 1);
    known(3,8) = keypoints2[match2[1]][2] * pow(2, keypoints2[match2[1]][3] + 1);

    // 5th row [-x3, -y3, -1, 0, 0, 0, x3*x3', y3*x3', x3']
    known(4,0) = -keypoints1[match3[0]][1] * pow(2, keypoints1[match3[0]][3] + 1);
    known(4,1) = -keypoints1[match3[0]][2] * pow(2, keypoints1[match3[0]][3] + 1);
    known(4,2) = -1;known(4,3) = 0; known(4,4) = 0;known(4,5) = 0;
    known(4,6) = keypoints1[match3[0]][1] * pow(2, keypoints1[match3[0]][3] + 1) *
                    keypoints2[match3[1]][1] * pow(2, keypoints2[match3[1]][3] + 1);
    known(4,7) = keypoints1[match3[0]][2] * pow(2, keypoints1[match3[0]][3] + 1) *
                    keypoints2[match3[1]][1] * pow(2, keypoints2[match3[1]][3] + 1);
    known(4,8) = keypoints2[match3[1]][1] * pow(2, keypoints2[match3[1]][3] + 1);

    // 6th row [0, 0, 0, -x3, -y3, -1, x3*y3', y3*y3', y3']
    known(5,0) = 0; known(5,1) = 0; known(5,2) = 0;
    known(5,3) = -keypoints1[match3[0]][1] * pow(2, keypoints1[match3[0]][3] + 1);
    known(5,4) = -keypoints1[match3[0]][2] * pow(2, keypoints1[match3[0]][3] + 1);
    known(5,5) = -1;
    known(5,6) = keypoints1[match3[0]][1] * pow(2, keypoints1[match3[0]][3] + 1) *
                    keypoints2[match3[1]][2] * pow(2, keypoints2[match3[1]][3] + 1);
    known(5,7) = keypoints1[match3[0]][2] * pow(2, keypoints1[match3[0]][3] + 1) *
                    keypoints2[match3[1]][2] * pow(2, keypoints2[match3[1]][3] + 1);
    known(5,8) = keypoints2[match3[1]][2] * pow(2, keypoints2[match3[1]][3] + 1);

    // 7th row [-x4, -y4, -1, 0, 0, 0, x4*x4', y4*x4', x4']
    known(6,0) = -keypoints1[match4[0]][1] * pow(2, keypoints1[match4[0]][3] + 1);
    known(6,1) = -keypoints1[match4[0]][2] * pow(2, keypoints1[match4[0]][3] + 1);
    known(6,2) = -1;known(6,3) = 0; known(6,4) = 0;known(6,5) = 0;
    known(6,6) = keypoints1[match4[0]][1] * pow(2, keypoints1[match4[0]][3] + 1) *
                    keypoints2[match4[1]][1] * pow(2, keypoints2[match4[1]][3] + 1);
    known(6,7) = keypoints1[match4[0]][2] * pow(2, keypoints1[match4[0]][3] + 1) *
                    keypoints2[match4[1]][1] * pow(2, keypoints2[match4[1]][3] + 1);
    known(6,8) = keypoints2[match4[1]][1] * pow(2, keypoints2[match4[1]][3] + 1);

    // 8th row [0, 0, 0, -x4, -y4, -1, x4*y4', y4*y4', y4']
    known(7,0) = 0; known(7,1) = 0; known(7,2) = 0;
    known(7,3) = -keypoints1[match4[0]][1] * pow(2, keypoints1[match4[0]][3] + 1);
    known(7,4) = -keypoints1[match4[0]][2] * pow(2, keypoints1[match4[0]][3] + 1);
    known(7,5) = -1;
    known(7,6) = keypoints1[match4[0]][1] * pow(2, keypoints1[match4[0]][3] + 1) *
                    keypoints2[match4[1]][2] * pow(2, keypoints2[match4[1]][3] + 1);
    known(7,7) = keypoints1[match4[0]][2] * pow(2, keypoints1[match4[0]][3] + 1) *
                    keypoints2[match4[1]][2] * pow(2, keypoints2[match4[1]][3] + 1);
    known(7,8) = keypoints2[match4[1]][2] * pow(2, keypoints2[match4[1]][3] + 1);


    MatrixXf A = MatrixXf::Zero(8, 8); // 2n by 8 matrix
    VectorXf b(8); // 2n by 1 vector
	for (int i = 0; i < 4; i++) {
        b(2*i) = keypoints2[matches[i][1]][1] * pow(2, keypoints2[matches[i][1]][3] + 1); // x'
        b(2*i + 1) = keypoints2[matches[i][1]][2] * pow(2, keypoints2[matches[i][1]][3] + 1); // y'

        A(2*i, 0) = keypoints1[matches[i][0]][1] * pow(2, keypoints1[matches[i][0]][3] + 1); // x
        A(2*i, 1) = keypoints1[matches[i][0]][2] * pow(2, keypoints1[matches[i][0]][3] + 1); // y
        A(2*i, 2) = 1;
        A(2*i, 6) = - A(2*i, 0) * b(2*i); // -x*x'
        A(2*i, 7) = - A(2*i, 1)  * b(2*i); // -y*x'

        A(2*i + 1, 3) = b(2*i); // x'
        A(2*i + 1, 4) = b(2*i + 1); // y'
        A(2*i + 1, 5) = 1;
        A(2*i + 1, 6) = -  A(2*i, 0) * b(2*i + 1); // -x*y'
        A(2*i + 1, 7) = -  A(2*i, 1) * b(2*i + 1); // -y*y'
    }

    // solve Ah = b and form homography matrix H
    VectorXf h = A.colPivHouseholderQr().solve(b); // solve using QR decomposition
    Matrix3f H(3, 3);
    H(0, 0) = h(0); H(0, 1) = h(1); H(0, 2) = h(2);
    H(1, 0) = h(3); H(1, 1) = h(4); H(1, 2) = h(5);
    H(2, 0) = h(6); H(2, 1) = h(7); H(2, 2) = 1;


    // compute the SVD of the known values
    // explanation for what SVD is here: http://gregorygundersen.com/blog/2018/12/10/svd/
    Eigen::JacobiSVD<Eigen::Matrix<float, 8, 9>> svd(known, Eigen::ComputeFullU | Eigen::ComputeFullV);


    // extract the V portion of SVD
    Eigen::Matrix<float, 9, 9> V = svd.matrixV();

    // extract the relevant solution to the homography matrix
    Eigen::Matrix<float, 9, 1> H0 = V.col(8);

    Matrix3f homography;
    homography << H0(0,0), H0(1,0), H0(2,0),
                  H0(3,0), H0(4,0), H0(5,0),
                  H0(6,0), H0(7,0), H0(8,0);


    return H;
}
 
// stitching the images together
Matrix3f computeAutoHomograph(const FloatImage &im1, const FloatImage &im2, int levels, int interestMaxNum, int iterations, float epsilon, float thres){
    // Double the size of the new stitch because I'm not too sure how to accurately stitch 

    vector<FloatImage> pyra1 = grayscalePyramid(im1, levels);
    vector<FloatImage> pyra2= grayscalePyramid(im2, levels);
    cout << "grayscale pryamid done" << endl;
    vector<vector<float>> feature1 = harris(im1, levels, pyra1);
    vector<vector<float>> feature2 = harris(im2, levels, pyra2);
    cout << "feature finding done" << endl;
    feature1 = suppress(interestMaxNum, feature1);
    feature2 = suppress(interestMaxNum, feature2);
    cout << "feature suppression done" << endl;
    vector<vector<float>> descriptor1 = featureDescriptors(im1, pyra1, feature1);
    vector<vector<float>> descriptor2 = featureDescriptors(im2, pyra2, feature2);
    cout << "feature descriptors done" << endl;
    vector<vector<int>> matches = featureMatching(im1, im2, feature1, feature2, descriptor1, descriptor2);
    cout << "feature matching done" << endl;
    Matrix3f homograph = myRANSAC(im2, feature1, feature2, matches, iterations, epsilon, thres);
    cout << "ransac done" << endl;
    cout << homograph << endl;
    return homograph;
}

FloatImage showMatchingPoints(const FloatImage &im1, const FloatImage &im2){
    int maxHeight = max(im1.height(), im2.height());
    FloatImage newComp(im1.width() + im2.width(), maxHeight, 3);

    for(int a = 0; a < im1.width(); a++){
        for(int b = 0; b < im1.height(); b++){
            for(int c = 0; c < im1.channels(); c++){
                newComp(a,b,c) = im1.smartAccessor(a,b,c);
            }
        }
    }
    for(int a = 0; a < im2.width(); a++){
        for(int b = 0; b < im2.height(); b++){
            for(int c = 0; c < im2.channels(); c++){
                newComp(im1.width() + a,b,c) = im2.smartAccessor(a,b,c);
            }
        }
    }
    vector<FloatImage> pyra1 = grayscalePyramid(im1, 5);
    vector<FloatImage> pyra2= grayscalePyramid(im2, 5);
    cout << "grayscale pryamid done" << endl;
    vector<vector<float>> feature1 = harris(im1, 5, pyra1);
    vector<vector<float>> feature2 = harris(im2, 5, pyra2);
    cout << "feature finding done" << endl;
    feature1 = suppress(500, feature1);
    feature2 = suppress(500, feature2);

    // ---------- visualize supressed feature points ----------
    // FloatImage output1(im1.width(), im1.height(), im1.channels());
    // FloatImage output2(im1.width(), im1.height(), im1.channels());
    // for (int i = 0; i < output1.width(); i++) {
	// 	for (int j = 0; j < output1.height(); j++) {
	// 		for (int c = 0; c < output1.channels(); c++) {
    //             output1(i, j, c) = im1(i, j, c);
    //             output2(i, j, c) = im2(i, j, c);
    //         }
    //     }
    // }
    // for (int i = 0; i < (int) feature1.size(); i++) {
    //     output1(feature1[i][1]*pow(2,feature1[i][3]+1), feature1[i][2]*pow(2,feature1[i][3]+1), 0) = 1;
    //     output1(feature1[i][1]*pow(2,feature1[i][3]+1), feature1[i][2]*pow(2,feature1[i][3]+1), 1) = 0;
    //     output1(feature1[i][1]*pow(2,feature1[i][3]+1), feature1[i][2]*pow(2,feature1[i][3]+1), 2) = 0;
    //     output2(feature2[i][1]*pow(2,feature2[i][3]+1), feature2[i][2]*pow(2,feature2[i][3]+1), 0) = 1;
    //     output2(feature2[i][1]*pow(2,feature2[i][3]+1), feature2[i][2]*pow(2,feature2[i][3]+1), 1) = 0;
    //     output2(feature2[i][1]*pow(2,feature2[i][3]+1), feature2[i][2]*pow(2,feature2[i][3]+1), 2) = 0;
    // }
    // output1.write("../data/output/supress1.jpg");
    // output2.write("../data/output/supress2.jpg");
    
    cout << "feature suppression done" << endl;
    vector<vector<float>> descriptor1 = featureDescriptors(im1, pyra1, feature1);
    vector<vector<float>> descriptor2 = featureDescriptors(im2, pyra2, feature2);
    cout << "feature descriptors done" << endl;

    vector<vector<int>> matches = featureMatching(im1, im2, feature1, feature2, descriptor1, descriptor2);
    cout << "feature matching done" << endl;
    
    for(int i = 0; i < (int) matches.size(); i++){
        int i0 = matches[i][0];
        int i1 = matches[i][1];
        int x0 = feature1[i0][1] * pow(2, feature1[i0][3] + 1);
        int x1 = feature1[i1][1] * pow(2, feature1[i1][3] + 1);
        int y0 = feature1[i0][2] * pow(2, feature1[i0][3] + 1);
        int y1 = feature1[i1][2] * pow(2, feature1[i1][3] + 1);
        float slope = (float)(y1-y0)/(x1+im1.width()-x0);
        for(int j = 0; j < x1+im1.width()-x0; j++){
            newComp(x0+j, round(y0+j*slope),0) += 254;
        }
        
        newComp(x0, y0,0) = 254;
        newComp(x0, y0,1) = 0;
        newComp(x0, y0,2) = 0;
        newComp(x1 + im1.width(), y1,0) = 254;
        newComp(x1 + im1.width(), y1,1) = 0;
        newComp(x1 + im1.width(), y1,2) = 0;
    }
    return newComp;
}

FloatImage autoStitch(const FloatImage &im1, const FloatImage &im2)
{
    // warp left image and determine output image size
    Matrix3f H = computeAutoHomograph(im1, im2, 5, 500, 3000, 0.18, 0.8);
    return stitch(im1, im2, H);
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
	for (int x = 0; x < im.width(); ++x) {
		for (int y = 0; y < im.height(); ++y) {
			for (int z = 0; z < im.channels(); ++z) {
				mag(x,y,z) = sqrt(pow(xMag(x,y,z),2) + pow(yMag(x,y,z),2));
                orientation(x,y,z) = atan2f(yMag(x,y,z), xMag(x,y,z)); // arctan
			}
        }
    }

    vector<FloatImage> magOri;
    magOri.push_back(xMag);
    magOri.push_back(yMag);
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



/***************************************************
 //                 USING OPEN CV                 //
 ***************************************************/

// use opencv
vector<vector<int>> featureMatching2(const FloatImage &im1, const FloatImage &im2, vector<vector<float>> keypoints1, 
    vector<vector<float>> keypoints2, vector<vector<float>> descriptors1, vector<vector<float>> descriptors2) {

    assert((keypoints1.size() == descriptors1.size()) && (keypoints2.size() == descriptors2.size()) && 
        (keypoints1.size() == keypoints2.size()));

    vector<DMatch> matches;
    Mat desc1;
    for (int i = 0; i < (int) descriptors1.size(); i++) {
        desc1.push_back(descriptors1[i]);
    }
    Mat desc2;
    for (int i = 0; i < (int) descriptors2.size(); i++) {
        desc2.push_back(descriptors2[i]);
    }

    BFMatcher desc_matcher(cv::NORM_L2, true);
    desc_matcher.match(desc1, desc2, matches, Mat());
    std::sort(matches.begin(), matches.end());
    cout << "made it here" << endl;

    const int numGoodMatches = matches.size() * 0.15f;
    cout << numGoodMatches << endl;
    matches.erase(matches.begin()+numGoodMatches, matches.end());

    Mat imMatches;
    vector<KeyPoint> k1;
    for (int i = 0; i < (int) keypoints1.size(); i++) {
        k1.push_back(KeyPoint(Point2f(keypoints1[i][0], keypoints1[i][1]), 4));
    }
    vector<KeyPoint> k2;
    for (int i = 0; i < (int) keypoints2.size(); i++) {
        k2.push_back(KeyPoint(Point2f(keypoints2[i][0], keypoints2[i][1]), 4));
    }
    im1.write("temp1.jpg");
    im2.write("temp2.jpg");
    Mat imMat1 = imread("temp1.jpg", IMREAD_COLOR);
    Mat imMat2 = imread("temp2.jpg", IMREAD_COLOR);
    drawMatches(imMat1, k1, imMat2, k2, matches, imMatches);
    imwrite("matches.jpg", imMatches);

    vector<vector<int>>  matchIndices;
    return matchIndices;
}
