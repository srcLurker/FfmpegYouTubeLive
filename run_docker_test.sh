#!/bin/bash
docker stop dffmpeg
docker rm dffmpeg
docker run \
  --name dffmpeg \
  --net=host \
  -v ${PWD}:/opt/external \
  --entrypoint=/bin/bash \
  -it \
  docker_ffmpeg

