#!/bin/bash

ffmpeg -f concat -safe 0 -i output.txt -c copy video.mp4
