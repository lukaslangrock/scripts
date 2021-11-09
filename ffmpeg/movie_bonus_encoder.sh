#!/bin/sh
# Designed to encode all bonus content that comes with DVDs and BDs to save space while maintaining a decent quality.
# DO NOT USE THIS FOR THE ACTUAL MOVIE! The scripts only keeps the main audio track, downmixes it to stereo and disregards all other subs.
# Please check your encode before deleting the original.

# magic that allows folders with dots to not cause issues
IFS='
'
set -f

#actual loop
for i in $(find . -name '*.mkv'); do
  echo "Encoding mkv: ${i}"
  ffmpeg -n -i "${i}" -map 0:v:0 -map 0:a:0? -pix_fmt yuv420p10le -c:v libx265 -crf 22 -preset fast -c:a libopus -b:a 128k -vbr on -ac 2 -metadata:s:v:0 title="HEVC/x265 (crf22@fast)" -metadata:s:a:0 title="Opus (~128kbps, 2.0)" "${i%.*}_[HEVC][OPUS].mkv"
done

# Additional presets I made:
# To use them just copy the entire line and replace the content of line #14 with it.
# The MiB stats show the filesize of an example encode of mine from 2 minute BD-Rip bonus scene which was orignally ~500 MiB in size.
# For fine tuning of quality/efficiency you can lower the speed preset to "medium" or "slow" and change the crf value (lower crf = better quality).

# Original Command for "Good Enough" Quality (~ 32 MiB)
# ffmpeg -n -i "${i}" -map 0:v:0 -map 0:a:0? -pix_fmt yuv420p10le -c:v libx265 -crf 22 -preset fast -c:a libopus -b:a 128k -vbr on -ac 2 -metadata:s:v:0 title="HEVC/x265 (crf22@fast)" -metadata:s:a:0 title="Opus (~128kbps, 2.0)" "${i%.*}_[HEVC][OPUS].mkv"

# Higher Quality (~ 90 MiB):
# ffmpeg -n -i "${i}" -map 0:v:0 -map 0:a:0? -pix_fmt yuv420p10le -c:v libx265 -crf 18 -preset fast -c:a libopus -b:a 128k -vbr on -ac 2 -metadata:s:v:0 title="HEVC/x265 (crf18@fast)" -metadata:s:a:0 title="Opus (~128kbps, 2.0)" "${i%.*}_[HEVC][OPUS].mkv"

# Higher Quality with Original Audio (~ 112 MiB):
# ffmpeg -n -i "${i}" -map 0:v:0 -map 0:a:0? -pix_fmt yuv420p10le -c:v libx265 -crf 18 -preset fast -c:a copy -metadata:s:v:0 title="HEVC/x265 (crf18@fast)" "${i%.*}_[HEVC].mkv"
