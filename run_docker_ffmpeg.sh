#!/bin/bash
docker stop dffmpeg
docker rm dffmpeg
docker run \
  --detach \
  --name dffmpeg \
  --restart=always \
  --log-opt max-size=100m \
  --log-opt max-file=10 \
  --net=host \
  -v ${PWD}:/opt/external \
  docker_ffmpeg

