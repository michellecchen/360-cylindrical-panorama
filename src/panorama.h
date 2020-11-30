#pragma once

// panorama.h

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
FloatImage stitch(const FloatImage &im1, const FloatImage &im2, const std::vector<std::vector<int>> im1Points, const std::vector<std::vector<int>> im2Points);
FloatImage stitchWarpBoth(const FloatImage &im1, const FloatImage &im2, const std::vector<std::vector<int>> im1Points, const std::vector<std::vector<int>> im2Points);
std::vector<float> convertToCylinder(float x, float y, int w, int h, float focal, float radius);
FloatImage warpCylinder(const FloatImage &im, int focal, int radius);
std::vector<FloatImage> warpAll(std::vector<FloatImage> &images, int focal, int radius);
FloatImage stitchCylinder(std::vector<FloatImage> &images, std::vector<int> boundaries, int focal);
std::vector<int> convertBoundaries(std::vector<int> boundaries, int radius, int focal, int w, int h);
int calculateCircumference(const std::vector<int> boundaries);
int getFocalLength(float focalMM, float sensorWidth, FloatImage &im);
// Part B
