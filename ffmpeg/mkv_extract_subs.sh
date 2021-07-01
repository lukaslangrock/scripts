#!/bin/sh
#Extracts subtitles and attachments from mkv files.

# magic that allows folders with dots to not cause issues
IFS='
'
set -f

#actual loop
for i in $(find . -name '*.mkv' ! -name "*_subs.mkv"); do
  echo "Extracting subs from: ${i}"
  ffmpeg -y -i "${i}" -c copy -map 0:s -map 0:t "${i%.*}_subs.mkv"
done
