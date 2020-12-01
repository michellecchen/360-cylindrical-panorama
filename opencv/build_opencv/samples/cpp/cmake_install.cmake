# Install script for directory: /Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Users/tanli/dev/cs73/panorama-opencv/opencv/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RELEASE")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Library/Developer/CommandLineTools/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xsamplesx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/opencv4/samples/cpp" TYPE FILE FILES
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/3calibration.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/CMakeLists.txt"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/application_trace.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/bgfg_segm.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/calibration.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/camshiftdemo.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/cloning_demo.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/cloning_gui.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/connected_components.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/contours2.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/convexhull.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/cout_mat.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/create_mask.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/dbt_face_detection.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/delaunay2.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/demhist.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/detect_blob.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/detect_mser.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/dft.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/digits.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/dis_opticalflow.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/distrans.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/drawing.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/edge.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/ela.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/em.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/facedetect.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/facial_features.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/falsecolor.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/fback.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/ffilldemo.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/filestorage.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/fitellipse.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/grabcut.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/image_alignment.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/imagelist_creator.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/imagelist_reader.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/inpaint.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/intersectExample.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/kalman.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/kmeans.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/laplace.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/letter_recog.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/lkdemo.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/logistic_regression.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/mask_tmpl.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/matchmethod_orb_akaze_brisk.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/minarea.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/morphology2.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/neural_network.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/npr_demo.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/opencv_version.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/pca.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/peopledetect.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/phase_corr.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/points_classifier.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/polar_transforms.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/qrcode.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/segment_objects.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/select3dobj.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/simd_basic.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/smiledetect.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/squares.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/stereo_calib.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/stereo_match.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/stitching.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/stitching_detailed.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/train_HOG.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/train_svmsgd.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/travelsalesman.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/tree_engine.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/videocapture_basic.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/videocapture_camera.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/videocapture_gphoto2_autofocus.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/videocapture_gstreamer_pipeline.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/videocapture_image_sequence.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/videocapture_intelperc.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/videocapture_openni.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/videocapture_starter.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/videowriter_basic.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/warpPerspective_demo.cpp"
    "/Users/tanli/dev/cs73/panorama-opencv/opencv/opencv/samples/cpp/watershed.cpp"
    )
endif()

