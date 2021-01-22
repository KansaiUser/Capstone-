#!/bin/bash

docker run -p 4567:4567 \
           -v $PWD:/capstone \
           -v /tmp/log:/root/.ros/ \
           --user 1000:1000 \
           -v /etc/passwd:/etc/passwd \
           -v /etc/group:/etc/group \
           -v $HOME:$HOME
           --rm -it capstone