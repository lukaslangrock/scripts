#!/bin/sh
#Convert all MXF files to an MP4 preview

# magic that allows folders with dots to not cause issues
IFS='
'
set -f

#actual loop
for i in $(find . -name '*.MXF'); do
  echo "Generating preview: ${i}"
  ffmpeg -hwaccel auto -y -i "${i}" -vf yadif -pix_fmt yuv420p -c:v libx264 -tune film -preset faster -crf 28 -c:a aac -ac 1 -b:a 64k "${i%.*}_preview.mp4"
done
