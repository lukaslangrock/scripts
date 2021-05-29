#!/bin/bash
# Script for sorting all episodes of the same number into a respective folder

# magic that allows folders with dots to not cause issues
IFS='
'
set -f

# Get range
echo "I need you to specify the range of episode numbers you want this scripts to search for"
read -p "Enter minimum range: " range_min
read -p "Enter maximum range: " range_max

# find and move episodes
for ((i = range_min ; i <= range_max ; i++)); do
  printf -v i "%02d" $i # prefix 0 to single digit numbers
  echo "Searching for episode $i"
  for j in $(find . -name "*${i}*"); do
    echo "Moving: ${j}"
    mkdir -p "Episode ${i}"
    mv ${j} "./Episode ${i}/"
  done
done
