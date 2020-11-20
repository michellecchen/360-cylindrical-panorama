/*!
    \file homography.h
    \brief Using RANSAC to compute a homography
    \author Michelle Chen
    
    CS73 Final Project (Group 2)
*/
#pragma once

#include <array>
#include "floatimage.h"
#include "array3D.h"
#include "exceptions.h"
#include <iostream>
#include <math.h>

void harris(const FloatImage im, int edge_discard=5);
vector<float> convert_im_type(const FloatImage im);
vector<Vec2f> suppress(int n, vector<Vec2f> keypoints);

