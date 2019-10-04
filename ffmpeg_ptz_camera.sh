#!/bin/bash
#
# Script to startup the youtube live camera feed from the roof camera
# For example the cameras near the roof pointing to the hillside/driveway
# or the camera watching the bridge
#

EXTERNAL=/opt/external

# From:
# https://www.youtube.com/live_dashboard?ar=2&nv=1
#
# youtube url: 
# rtmp://a.rtmp.youtube.com/live2
#
YOUTUBE_KEY="ADD_YOUR_OWN_YOUTUBE_LIVE_KEY_HERE"

# The camera url. Every camera is different but it
# usually has some form of rtsp://localaddress:port/path/to/stream"
#
# In my case it was:
# rtsp://192.168.86.219:8554/mpeg4/ch33/main/av_stream
#
CAMERA="ADD_YOUR_RTSP_CAMERA_URL_HERE"

ffmpeg \
   -f lavfi \
   -i anullsrc \
   -rtsp_transport tcp \
   -i rtsp://camera:showVideo@192.168.86.219:8554/mpeg4/ch33/main/av_stream \
   -i ${CAMERA} \
   -tune zerolatency \
   -vcodec libx264 \
   -t 18:00:00 \
   -b:v 3700k \
   -minrate 3500k \
   -maxrate 4500k \
   -pix_fmt + \
   -c:v copy \
   -c:a aac \
   -strict experimental \
   -f flv \
   rtmp://a.rtmp.youtube.com/live2/${YOUTUBE_KEY}
