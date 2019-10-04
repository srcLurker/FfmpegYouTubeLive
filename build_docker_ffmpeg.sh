#!/bin/bash
export DOCKER_CONTENT_TRUST=1
docker build -f Dockerfile_ffmpeg -t docker_ffmpeg .

