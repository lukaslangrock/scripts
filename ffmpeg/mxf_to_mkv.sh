#!/bin/sh
#Convert/Mux all MXF files losslessly to an MKV

# magic that allows folders with dots to not cause issues
IFS='
'
set -f

#actual loop
for i in $(find . -name '*.MXF'); do
  echo "Generating preview: ${i}"
  ffmpeg -i "${i}" -filter_complex "[0:a:0][0:a:1] amerge=inputs=2 [a]" -map 0:v -map "[a]" -c:v copy -c:a flac -ac 2 "${i%.*}.MKV"
done
