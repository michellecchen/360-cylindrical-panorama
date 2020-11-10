#include <iostream>
#include "panorama.h"
#include <filesystem>

#define DIR "../data"

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

// test functions
int main()
{
	// uncomment to test these functions
    try { testSmartAccessor();}   catch(...) {cout << "testSmartAccessor Failed!" << endl;}
}
