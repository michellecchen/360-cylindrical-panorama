#include <iostream>
#include "mosaic.h"
#include <filesystem>

#define DIR "../data"
using namespace Eigen;
using namespace std;

// test the smart accessor function
void testSmartAccessor()
{
	// load an image and create 2 images that will test the smart accessor
	const FloatImage input(DIR "/input/bear.png");
	input.write(DIR "/output/bear.png");

	FloatImage clampTrue(input.width(), input.height(), input.channels());
	FloatImage clampFalse(input.width(), input.height(), input.channels());

	for (int z = 0; z < input.channels(); z++)
	{
		for (int x = 0; x < input.width(); x++)
		{
			for (int y = 0; y < input.height(); y++)
			{
				// replace non-valid pixel values with the value of the nearest pixel
				clampTrue(x, y, z) = input.smartAccessor(x - 10, y - 10, z, true);
				// replace non-valid pixel values with black (value=0)
				clampFalse(x, y, z) = input.smartAccessor(x - 10, y - 10, z);
			}
		}
	}

	clampTrue.write(DIR "/output/smartAccessor_clampTrue.png");
	clampFalse.write(DIR "/output/smartAccessor_clampFalse.png");
}

void testHomographyAndWarp()
{
	std::vector<std::vector<int>> im1Points = {{0,0}, {0,84}, {127,0}, {127,84}};
	std::vector<std::vector<int>> im2Points = {{0,0}, {30,84}, {127,0}, {97,84}};
	Eigen::Matrix3f H = computeHomography(im1Points, im2Points);
	std::cout << H << std::endl;

	const FloatImage im(DIR "/input/bear.png"); // 85 by 128
	FloatImage warpedIm = warpImage(im, H);
	warpedIm.write(DIR "/output/warped.png");

	// FloatImage warpedIm = rectifyImage(im1, im1Points, im2Points);
	// warpedIm.write(DIR "/output/rectified.jpg");
}

void testStitch()
{
	const FloatImage im1(DIR "/input/ukulele1.jpg");
	const FloatImage im2(DIR "/input/ukulele2.jpg");
	std::vector<std::vector<int>> im1Points = {{190, 81}, {362, 81}, {261, 60}, {294, 136}, {196, 186}, {196, 199}};
	std::vector<std::vector<int>> im2Points = {{31, 81}, {207, 88}, {109, 62}, {143, 140}, {43, 197}, {44, 210}};

	// campanile images from https://inst.eecs.berkeley.edu/~cs194-26/sp20/upload/files/proj5B/cs194-26-aeu/
	// const FloatImage im1(DIR "/input/campanile1.jpg");
	// const FloatImage im2(DIR "/input/campanile2.jpg");
	// std::vector<std::vector<int>> im1Points = {{229, 50}, {243, 30}, {270, 38}, {273, 58}, {245, 51}, {262, 261}, {245, 9}, {259, 27}};
	// std::vector<std::vector<int>> im2Points = {{101, 40}, {118, 24}, {140, 42}, {139, 62}, {115, 46}, {85, 262}, {124, 5}, {133, 29}};

	FloatImage stitchedIm = stitch(im1, im2, im1Points, im2Points);
	stitchedIm.write(DIR "/output/stitched.jpg");

	stitchedIm = stitchWarpBoth(im1, im2, im1Points, im2Points);
	stitchedIm.write(DIR "/output/stitched-warp-both.jpg");
}

void testCylindricalWarp(){
	const FloatImage im1(DIR "/input/ukulele1.jpg");
	FloatImage result = warpCylinder(im1, im1.width() / 2, im1.width());
	result.write(DIR "/output/ukulele-cylinder.jpg");
}

void testWarpAll(){
	vector<FloatImage> images;
	for (int i = 9; i >=1; i--){
		FloatImage current_img(DIR "/input/cylinder" + std::to_string(i) + ".jpg");
		images.push_back(current_img);
	}
	int focal = getFocalLength(22.0, 22.3, images[0]);
	vector<FloatImage> results = warpAll(images, focal, images[0].width());
	for (int i = 1; i <= 9; i++){
		results[i- 1].write(DIR "/output/cylinder-warp" + std::to_string(i) + ".jpg");
	}
}
void test360(){
	// read in the images
	vector<FloatImage> images;
	for (int i = 11; i >=1; i--){
		FloatImage current_img(DIR "/input/room" + std::to_string(i) + ".jpg");
		images.push_back(current_img);
	}
	int focal = getFocalLength(22.0, 22.3, images[0]);
	vector<int> boundaries= {0, 320, 50, 430, 60, 450, 50, 320, 50, 510, 50, 450, 40, 470, 115, 470, 30, 350, 50, 305, 50, 320};
	 FloatImage result = stitchCylinder(images, boundaries, focal);
	result.write(DIR "/output/panorama360.jpg");
}
// test functions
int main()
{
	// uncomment to test these functions
    // try { testSmartAccessor();}   catch(...) {cout << "testSmartAccessor Failed!" << endl;}
	// try { testHomographyAndWarp();}   catch(...) {cout << "testHomographyAndWarp Failed!" << endl;}
	// try { testStitch();}   catch(exception& e) {std::cout << e.what() << std::endl;}
	// try { testCylindricalWarp();}   catch(exception& e) {std::cout << e.what() << std::endl;}
	try { test360();}   catch(exception& e) {std::cout << e.what() << std::endl;}
}
