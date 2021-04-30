#!/bin/sh
#Mux all MXF files losslessly to stereo MXF

# magic that allows folders with dots to not cause issues
IFS='
'
set -f

#actual loop
for i in $(find . -name '*.MXF'); do
  echo "Generating preview: ${i}"
  ffmpeg -n -i "${i}" -filter_complex "[0:a:0][0:a:1] amerge=inputs=2 [a]" -map 0:v -map "[a]" -c:v copy -c:a pcm_s16le -ac 2 "${i%.*}-STEREO.MXF"
done
