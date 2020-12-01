# CS73: Computational Photography - Final Project
## Michelle Chen, Jiro Mizuno, Charlie Nee, Tanli Su (Group 2)

Generating a panorama from a sequence of images via image warping, mosaicing, & auto-stitching.

### Part A (mosaic.h, mosaic.cpp)
1. Image warping and planar projection mosaicing. (Tanli)

### Part B (homography.h, homography.cpp)
(Michelle, Jiro)
1. Detecting corner features in an image: Using Harris Interest Point Detector.
2. Extracting a Feature Descriptor for each feature point: Extracting small, axis-aligned
patches, sampled from the larger window, with descriptors bias/gain-normalized.
3. Matching extracted features between two images: Finding pairs of similar features as
‘matches’; similarity is measured according to a threshold.
4. Computing a homography: Using a robust method (RANSAC).
5. Producing a mosaic using the stitch function from Part A.

### Part C (mosaic.h, mosaic.cpp)
1. Cylindrical 360-degree panorama. (Charlie)

## Results
The output image results can be found in the `data/output` directory.

Notes for part A image mosaicing results:
* We tested 3 methods for image mosaicing: using a simple overlap, a linear blend, and a sigmoid blend. Output images are shown for all 3 methods, but the sigmoid blend gave the best results.
* We also tested 2 methods for warping before stitching. The `stitchWarpLeft()` function warps the left image according to the right image and then stitches them together. The `stitchWarpBoth()` function takes the average of the two given sets of corresponding points, warps both the left and right images according to this set of points, and then stitches the two warped images together. The outputs for both methods are also shown; the method which warps only the left image seems to give slightly better results.

## Credits
Part A assignment guidelines from https://inst.eecs.berkeley.edu//~cs194-26/fa17/hw/proj6/partA.html

Part B assignment guidelines from https://inst.eecs.berkeley.edu//~cs194-26/fa17/hw/proj6/partB.html

The basecode is written by Wojciech Jarosz, but it is heavily derived from (with permission):

:information_source: MIT's 6.815/6.865 basecode, written and designed by:
* Frédo Durand
* Katherine L. Bouman
* Gaurav Chaurasia
* Adrian Vasile Dalca
* Neal Wadhwa