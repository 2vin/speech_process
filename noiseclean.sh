#!/bin/bash -e

echo "Usage : ./noiseclean.sh INPUTFOLDER OUTPUTFOLDER NOISEFACTOR(0.26)"

cd $1

for i in *.wav; do
rm -rf temp.wav
ffmpeg -i $i -af "volume=5dB" temp.wav
sox temp.wav -t null /dev/null trim 0 0.1 noiseprof myprofile
sox temp.wav $2/$i noisered myprofile $3
echo "File saved to $2/$i";
done
