/*!
    \file homography.h
    \brief Using RANSAC to compute a homography
    \author Michelle Chen & Jiro Mizuno
    
    CS73 Final Project (Group 2)
*/
#pragma once

#include <array>
#include "floatimage.h"
#include "array3D.h"
#include "exceptions.h"
#include <iostream>
#include <math.h>
#include <Eigen/Dense>

class Filter
{
public:
    std::vector<float> kernel;
    int width;
    int height;
    
    // function to convolve your filter with an image
    FloatImage Convolve(const FloatImage &im, bool clamp=true) const;
    
    // Accessors of the filter values
    const float & operator()(int x, int y) const;
    float & operator()(int x, int y);
    
    //Constructor
    Filter(const vector<float> &fData, const int &fWidth, const int &fHeight);
    Filter(const int &fWidth, const int &fHeight); // kernel with all zero

    // Destructor. Because there is no explicit memory management here, this doesn't do anything
    ~Filter();
    
// The following are functions and variables that are not accessible from outside the class
private:
    
};

vector<vector<float>> harris(const FloatImage im, int levels, vector<FloatImage> pyramid);
vector<vector<float>> suppress(int n, vector<vector<float>> keypoints);
vector<vector<float>> featureDescriptors(const FloatImage im, vector<FloatImage> pyramid, vector<vector<float>> keypoints);

// gaussian pyramid
vector<FloatImage> grayscalePyramid(const FloatImage &im, int levels);
vector<FloatImage> gaussianPyramid(const FloatImage &im, float sigma, float truncate, bool clamp, int level);

vector<vector<int>> featureMatching(const FloatImage im1, const FloatImage im2, 
    vector<vector<float>> keypoints1, vector<vector<float>> keypoints2, vector<vector<float>> descriptors1, vector<vector<float>> descriptors2);

float computeSumSquaredDist(vector<float> patch1, vector<float> patch2);

// grayscale 
FloatImage color2gray(const FloatImage &im, const vector<float> &weights);

// sobel operator
vector<FloatImage> gradientMagnitude(const FloatImage &im, bool clamp);

// Gaussian bluring
vector<float> gauss1DFilterValues(float sigma, float truncate);
FloatImage gaussianBlur_seperable(const FloatImage &im, float sigma, float truncate=3.0, bool clamp=true);

FloatImage impulseImg(const int &k);

