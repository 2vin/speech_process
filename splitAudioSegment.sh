#!/bin/bash -e

echo "Usage : ./splitAudioSegment.sh InputFolder"

cd $1

for i in *.wav; do ffmpeg -i $i -f segment -segment_time 3 -c copy `echo $i | cut -d'.' -f1`%d.wav; done

