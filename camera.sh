#!/bin/bash
#ラズパイのカメラで撮影

#シャッター音
aplay camera-shutter1.wav
#写真撮影
raspistill -o /home/pi/Pictures/clubroom.jpg -t 1
