#include <iostream>
#include "mosaic.h"
#include "homography.h"
#include <filesystem>

#define DIR "../data"

using namespace std;
using namespace Eigen;

// test the smart accessor function
// void testSmartAccessor()
// {
// 	// load an image and create 2 images that will test the smart accessor
// 	const FloatImage input(DIR "/input/bear.png");
// 	input.write(DIR "/output/bear.png");

// 	FloatImage clampTrue(input.width(), input.height(), input.channels());
// 	FloatImage clampFalse(input.width(), input.height(), input.channels());

// 	for (int z = 0; z < input.channels(); z++) {
// 		for (int x = 0; x < input.width(); x++) {
// 			for (int y = 0; y < input.height(); y++) {
// 				// replace non-valid pixel values with the value of the nearest pixel
// 				clampTrue(x, y, z) = input.smartAccessor(x - 10, y - 10, z, true);
// 				// replace non-valid pixel values with black (value=0)
// 				clampFalse(x, y, z) = input.smartAccessor(x - 10, y - 10, z);
// 			}
// 		}
// 	}

// 	clampTrue.write(DIR "/output/smartAccessor_clampTrue.png");
// 	clampFalse.write(DIR "/output/smartAccessor_clampFalse.png");
// }

void testHomographyAndWarp()
{
	vector<vector<int>> im1Points = {{0,0}, {0,84}, {127,0}, {127,84}};
	vector<vector<int>> im2Points = {{0,0}, {30,84}, {127,0}, {97,84}};
	Matrix3f H = computeHomography(im1Points, im2Points);
	cout << H << endl;

	const FloatImage im(DIR "/input/bear.png"); // 85 by 128
	FloatImage warpedIm = warpImage(im, H);
	warpedIm.write(DIR "/output/warped.png");

	// FloatImage warpedIm = rectifyImage(im1, im1Points, im2Points);
	// warpedIm.write(DIR "/output/rectified.jpg");
}

void testStitch()
{
	// const FloatImage im1(DIR "/input/ukulele1.jpg");
	// const FloatImage im2(DIR "/input/ukulele2.jpg");
	// vector<vector<int>> im1Points = {{190, 81}, {362, 81}, {261, 60}, {294, 136}, {196, 186}, {196, 199}};
	// vector<vector<int>> im2Points = {{31, 81}, {207, 88}, {109, 62}, {143, 140}, {43, 197}, {44, 210}};
	const FloatImage im1(DIR "/input/small_room2.jpg");
	const FloatImage im2(DIR "/input/small_room1.jpg");
	vector<vector<int>> im1Points = {{171, 42}, {172, 51}, {201, 109}, {196, 150}, {159, 106}, {175, 106}};
	vector<vector<int>> im2Points = {{36, 37}, {36, 47}, {70, 107}, {64, 150}, {21, 105}, {41, 106}};

	FloatImage stitchedIm = stitchWarpLeft(im1, im2, im1Points, im2Points);
	stitchedIm.write(DIR "/output/stitched.jpg");

	stitchedIm = stitchWarpBoth(im1, im2, im1Points, im2Points);
	stitchedIm.write(DIR "/output/stitched-warp-both.jpg");
}

void testFeatures(){
	const FloatImage im1(DATA_DIR "/input/ukulele1.jpg");
	const FloatImage im2(DATA_DIR "/input/ukulele2.jpg");
	FloatImage featureIM = showMatchingPoints(im1, im2);
	featureIM.write(DATA_DIR "/output/featureImage.jpg");
}

void testAutoStitch()
{
	const FloatImage im1(DATA_DIR "/input/ukulele1.jpg");
	const FloatImage im2(DATA_DIR "/input/ukulele2.jpg");

	FloatImage stitchedIm = autoStitch(im1, im2);
	stitchedIm.write(DATA_DIR "/output/autoStitched.jpg");
}

// test functions
int main()
{
	// uncomment to test these functions
    // try { testSmartAccessor();}   catch(...) {cout << "testSmartAccessor Failed!" << endl;}
	// try { testHomographyAndWarp();}   catch(...) {cout << "testHomographyAndWarp Failed!" << endl;}
	try { testStitch();}   catch(...) {cout << "testStitch Failed!" << endl;}
	// try { testAutoStitch();}   catch(...) {cout << "testAutoStitch Failed!" << endl;}
	// try { testFeatures();}   catch(...) {cout << "testFeatures Failed!" << endl;}
}