# Image Warping, Mosaicing, and Autostitching Images for a 360° Cylindrical Panorama

**CS 73: Computational Photography; Fall 2020**

Group 2 (Michelle Chen, Jiro Mizuno, Charlie Nee, Tanli Su)

Generating a panorama from a sequence of images via image warping, mosaicing, & auto-stitching.

## Part A
(Tanli)
1. Image warping and planar projection mosaicing. (Tanli)
* We tested 3 methods for image mosaicing: using a simple overlap, a linear blend, and a sigmoid blend. Output images are shown for all 3 methods, but the sigmoid blend gave the best results. The code for the simple overlap and linear blend methods has been commented out.
* We also tested 2 methods for warping before stitching. The `stitchWarpLeft()` function warps the left image according to the right image and then stitches them together. The `stitchWarpBoth()` function takes the average of the two given sets of corresponding points, warps both the left and right images according to this set of points, and then stitches the two warped images together. The outputs for both methods are also shown; the method which warps only the left image seems to give slightly better results.

### Sources for Part A
* Assignment description: https://inst.eecs.berkeley.edu//~cs194-26/fa17/hw/proj6/partA.html
* Recovering homographies: https://inst.eecs.berkeley.edu/~cs194-26/sp20/upload/files/proj5B/cs194-26-aeu/
* Eigen least squares solver documentation: https://eigen.tuxfamily.org/dox/group__LeastSquares.html

## Part B
(Michelle, Jiro)
1. Detecting corner features in an image: Using Harris Interest Point Detector.
2. Extracting a Feature Descriptor for each feature point: Extracting small, axis-aligned
patches, sampled from the larger window, with descriptors bias/gain-normalized.
3. Matching extracted features between two images: Finding pairs of similar features as
‘matches’; similarity is measured according to a threshold.
4. Computing a homography: Using a robust method (RANSAC).
5. Producing a mosaic using the stitch function from Part A.

Part B is contained within `homography.h` and `homography.cpp`; main functions include Harris Interest Point Detection, Adaptive Non-Maximal Suppression, feature descriptor generation via Multi-Scale Oriented Patches (MOPS), feature matching based on descriptors, and RAndom SAmple Consensus (RANSAC).

All of these functions were implemented from scratch. No open-source libraries (i.e. OpenCV) were used in lieu of these functions.

**Disclaimer:** Unfortunately, the raw feature matching implementation doesn't return a desirable result; as such, we are only able to stitch, and not *auto*stitch, reliably. However, we are able to identify interest points, suppress them, and presumably, generate descriptors for them. We suspect that our feature matching function could benefit from descriptors that are more rotation-invariant, or more color-invariant. We were not able to detect any flaws within the algorithm itself, across hours of careful examination.

### Sources for Part B

For part B, we primarily referenced Brown et al.'s "Multi-Image Matching using Multi-Scale Oriented Patches," found [here.](https://inst.eecs.berkeley.edu//~cs194-26/fa17/Papers/MOPS.pdf)

More specific citations include:

* How to sort a C++ vertex in descending order:
https://www.geeksforgeeks.org/how-to-sort-a-vector-in-descending-order-using-stl-in-c/
* FLT_MAX usage & documentation:
https://www.cplusplus.com/reference/cfloat/
* Sorting a C++ vertex while tracking the original indices:
https://stackoverflow.com/questions/1577475/c-sorting-and-keeping-track-of-indexes
* Adjusting the values of a C++ vertex to change their mean and standard deviation:
https://stats.stackexchange.com/questions/46429/transform-data-to-desired-mean-and-standard-deviation
* Haar wavelet transformation:
https://people.sc.fsu.edu/~jburkardt/c_src/haar/haar.html 

## Part C
The code for part c can be found in the file `mosaic.cpp`. The final output image is called `panorama360.jpg`. Results of testing just the image warping are named `cylinder-warp[#].jpg`. Part C consists of two parts, image warping and image stitching. The method for image warping is explained in the first source of this section. Image stitching used translation with some sigmoid blending. The boundaries for stitching the images together (to make sure the images overlapped properly), was determined manually by opening the images up in an image editing program and looking for locations that were best suited for overlap. However, this can also be done via feature matching as [this student](http://pages.cs.wisc.edu/~vmathew/cs766-proj2/index.html) did.

### Functions
Image warping functions:
```
// projects coordinates onto the cylinder
std::vector<float> convertToCylinder(float x, float y, int w, int h, float focal, float radius);

// warps image onto the cylinder
FloatImage warpCylinder(const FloatImage &im, int focal, int radius);

// warps each image onto the cylinder
std::vector<FloatImage>warpAll(std::vector<FloatImage> &images, int focal, int radius);
```
Image stitching function:
```
// warps and stitches all images
FloatImage stitchCylinder(std::vector<FloatImage> &images, std::vector<int> boundaries, int focal);
```
Additional helper functions:
```
// converts the boundaries from the original images into cylindrical coordinates for stitching purposes
std::vector<int> convertBoundaries(std::vector<int> boundaries, int radius, int focal, int w, int h);

// calculates the circumference of the cylinder
int calculateCircumference(const std::vector<int> boundaries);

// calculates the focal length in pixels
int getFocalLength(float focalMM, float sensorWidth, FloatImage &im);
```
### Issues
Unfortunately, I did not have a tripod that rotated. This meant that in order to make sure the camera stayed in same spot as it rotated, I had to place it on the swivel chair. Despite many attempts and several hours, the cushion on the swivel chair introduced unlevel photos and weird tilt angles. Unfortunately, for this method to work, the images must be completely level with no vertical shift. However, on the images that came out level and untilted, the photos were joined smoothly as expected and on photos with only vertical shift, the images appeared angled in the expected direction suggesting that the warping and stitching was a success, and it was the photos themselves that were the problem. 

### Sources for Part C
* Mathematical explanation of cylindrical projection. This source was the basis for this section,and most of the theory was taken from this post: https://stackoverflow.com/questions/12017790/warp-image-to-appear-in-cylindrical-projection
* General background information: https://courses.cs.washington.edu/courses/cse576/08sp/lectures/Stitching.pdf
* General background information: https://graphics.stanford.edu/courses/cs448a-10/kari-panoramas-02mar10-opt.pdf
* General list of steps: http://pages.cs.wisc.edu/~vmathew/cs766-proj2/index.html
* Computing the focal length in mm: http://phototour.cs.washington.edu/focal.html

## Results
The output image results can be found in the `data/output` directory.

## General Credits (not part specific)
* Part A assignment guidelines from https://inst.eecs.berkeley.edu//~cs194-26/fa17/hw/proj6/partA.html

* Part B assignment guidelines from https://inst.eecs.berkeley.edu//~cs194-26/fa17/hw/proj6/partB.html

The basecode is written by Wojciech Jarosz, but it is heavily derived from (with permission):

:information_source: MIT's 6.815/6.865 basecode, written and designed by:
* Frédo Durand
* Katherine L. Bouman
* Gaurav Chaurasia
* Adrian Vasile Dalca
* Neal Wadhwa
