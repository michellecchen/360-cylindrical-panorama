#pragma once

// panorama.h

#include <array>
#include "floatimage.h"
#include <iostream>
#include <math.h>
#include <Eigen/Dense>

using namespace Eigen;

Matrix3f computeHomography(const std::vector<std::vector<int>> im1Points, const std::vector<std::vector<int>> im2Points);
float interpolateLin(const FloatImage &im, float x, float y, int z, bool clamp);
FloatImage warpImage(const FloatImage &im, const Matrix3f H);
FloatImage rectifyImage(const FloatImage &im, const std::vector<std::vector<int>> im1Points, const std::vector<std::vector<int>> im2Points);

