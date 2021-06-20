#!/bin/sh
#Designed to encode all bonus content that comes with DVDs and BDs to save space.
#DO NOT USE THIS FOR THE ACTUAL MOVIE! The scripts only keeps the main audio track and disregards all subs
#Please check your encode before deleting the original.

# magic that allows folders with dots to not cause issues
IFS='
'
set -f

#actual loop
for i in $(find . -name '*.mkv'); do
  echo "Encoding mkv: ${i}"
  ffmpeg -n -i "${i}" -map 0:v:0 -map 0:a:0? -c:v libx264 -crf 20 -preset slow -c:a copy "${i%.*}_[AVC][CRF-20-slow][BD-Encode].mkv"
done
