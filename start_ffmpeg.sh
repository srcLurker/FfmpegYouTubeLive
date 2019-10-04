#!/bin/bash
#
# Script to startup the youtube live camera feed.
# It uses a script from external so that the external
# script can be updated without updating the docker
# image.
# 
#

EXTERNAL=/opt/external


cd $EXTERNAL

while :
do
  ./current_ffmpeg.sh

  sleep 1
done
