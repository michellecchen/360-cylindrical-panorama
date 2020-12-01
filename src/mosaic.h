/*!
    \file mosaic.h (Part A)
    \brief Image warping and mosaicing
    \author Tanli Su & Charlie Nee
    
    CS73 Final Project (Group 2)
*/
#pragma once

#include <array>
#include "floatimage.h"
#include <iostream>
#include <math.h>
#include <Eigen/Dense>

// Part A
Eigen::Matrix3f computeHomography(const std::vector<std::vector<int>> im1Points, const std::vector<std::vector<int>> im2Points);
float interpolateLin(const FloatImage &im, float x, float y, int z, bool clamp);
std::vector<float> computeTransformedBBox(int width, int height, Eigen::Matrix3f H);
FloatImage warpImage(const FloatImage &im, const Eigen::Matrix3f H);
FloatImage rectifyImage(const FloatImage &im, const std::vector<std::vector<int>> im1Points, const std::vector<std::vector<int>> im2Points);
FloatImage stitch(const FloatImage &im1, const FloatImage &im2, const Eigen::Matrix3f H);
FloatImage stitchWarpLeft(const FloatImage &im1, const FloatImage &im2, const std::vector<std::vector<int>> im1Points, const std::vector<std::vector<int>> im2Points);
FloatImage stitchWarpBoth(const FloatImage &im1, const FloatImage &im2, const std::vector<std::vector<int>> im1Points, const std::vector<std::vector<int>> im2Points);
