#!/bin/sh
#Convert all MXF files to a high quality but space saving MKV

# magic that allows folders with dots to not cause issues
IFS='
'
set -f

#actual loop
for i in $(find . -name '*.MXF' ! -name "*STEREO.MXF"); do
  echo "Generating mkv: ${i}"
  ffmpeg -y -i "${i}" -vf yadif -pix_fmt yuv422p -filter_complex "[0:a:0][0:a:1] amerge=inputs=2 [a]" -map 0:v -map "[a]" -c:v libx264 -crf 15 -preset slow -c:a flac -ac 2 "${i%.*}.mkv"
done
