#!/bin/sh
#Designed to quickly encode all bonus content that comes with DVDs and BDs to save even more space. Works best if the non-lowq script didn't yield any noticeable improvements.
#DO NOT USE THIS FOR THE ACTUAL MOVIE! The scripts only keeps the main audio track and disregards all subs
#Please check your encode before deleting the original.

# magic that allows folders with dots to not cause issues
IFS='
'
set -f

#actual loop
for i in $(find . -name '*.mkv'); do
  echo "Encoding mkv: ${i}"
  ffmpeg -n -i "${i}" -map 0:v:0 -map 0:a:0? -c:v libx264 -crf 24 -preset fast -c:a libopus -b:a 128K -ac 2 -vbr on -metadata:s:a:0 title="Stereo (Opus ~128kb/s)" "${i%.*}_[AVC][CRF-24-fast][OPUS][BD-Encode].mkv"
done
