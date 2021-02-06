#!/bin/bash

xhost +local:root
# or is it
# xhost +local:docker 

docker run -p 4567:4567 \
           -v $PWD:/capstone \
           -v /tmp/log:/root/.ros/ \
           -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
           --env=DISPLAY \
           --rm -it capstone2