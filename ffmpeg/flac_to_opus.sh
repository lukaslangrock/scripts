#!/bin/sh
# Convert FLAC files to Opus ~128k for mobile listening

# magic that allows folders with dots to not cause issues
IFS='
'
set -f

#actual loop
for i in $(find . -name '*.flac'); do
  echo "Encoding: ${i}"
  ffmpeg -n -i "${i}" -c:a libopus -b:a 128k -vbr on -metadata:s:a:0 title="Opus@~128k"  "${i%.*}.opus"
done
