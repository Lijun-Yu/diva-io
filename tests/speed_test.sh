#! /bin/bash

set -e

video_dir=$1
cd $(dirname $0)

echo "avi_r.AVIReader(fix_missing=True)"
time python -c "from test import speed_test_avi_r; speed_test_avi_r(\"$video_dir\", True)"

echo "avi_r.AVIReader(fix_missing=False)"
time python -c "from test import speed_test_avi_r; speed_test_avi_r(\"$video_dir\", False)"

echo "moviepy.editor.VideoFileClip"
time python -c "from test import speed_test_moviepy; speed_test_moviepy(\"$video_dir\")"

echo "cv2.VideoCapture"
time python -c "from test import speed_test_opencv; speed_test_opencv(\"$video_dir\")"
