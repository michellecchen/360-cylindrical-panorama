# CS73: Computational Photography - Final Project
## Michelle Chen, Jiro Mizuno, Charlie Nee, Tanli Su (Group 2)

Generating a panorama from a sequence of images via image warping, mosaicing, & auto-stitching.

### Part A
1. Image warping and planar projection mosaicing: ​Completing the assignment as it is
written, without any modifications.
2. Cylindrical 360-degree panorama: ​Using a cylindrical projection to create a more
robust panorama.

### Part B
1. Detecting corner features in an image: Using Harris Interest Point Detector.
2. Extracting a Feature Descriptor for each feature point: Extracting small, axis-aligned
patches, sampled from the larger window, with descriptors bias/gain-normalized.
3. Matching extracted features between two images: Finding pairs of similar features as
‘matches’; similarity is measured according to a threshold.
4. Computing a homography: Using a robust method (RANSAC).
5. Producing a mosaic.

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