#!/bin/sh
#Encode all png files to avif's using AV1.
#Make sure you have aom(enc) installed. (https://aomedia.googlesource.com/aom/#building-the-library-and-applications)

# WARNING: This script will DELETE the riginal files. Make sure you have a backup, otherwise delete line number 16 (rm ${i}) to disable this function. 
# You can tune the compression level by changing `cq-level=XX`. Lower values have higher quality and higher ones will result in smaller files. I found 35 to achieve a good middle ground for 1920x1080 screenshots. 

# Source for encoding parameters: https://www.reddit.com/r/AV1/comments/o7s8hk/high_quality_encoding_of_avif_images_using/

# magic that allows folders with dots to not cause issues
IFS='
'
set -f

#actual loop
for i in $(find . -name '*.png'); do
  echo "Compressing picture: ${i}"
  avifenc -s 3 -j 8 --min 0 --max 63 -a end-usage=q -a cq-level=35 -a color:aq-mode=1 -a color:sharpness=2 -d 10 -a color:enable-chroma-deltaq=1 -a color:qm-min=0 -a color:deltaq-mode=3 "${i}" "${i%.*}.avif"
  rm ${i}
done
