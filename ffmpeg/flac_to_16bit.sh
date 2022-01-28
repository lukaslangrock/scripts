#!/bin/sh
# Convert FLAC files to 16bit audio (and keeping the picture)
# WARNING: This script deletes the original files

# magic that allows folders with dots to not cause issues
IFS='
'
set -f

#actual loop
for i in $(find . -name '*.flac'); do
  echo "Encoding: ${i}"
  mv ${i} ${i}.temp
  ffmpeg -n -i "${i}.temp"  -sample_fmt s16 -c:v copy  "${i%.*}.flac"
  rm ${i}.temp
done
