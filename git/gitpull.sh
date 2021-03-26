#!/bin/sh
#This script goes into each subdirectory and executes a git pull
#Credit: https://stackoverflow.com/questions/7470165/how-to-go-to-each-directory-and-execute-a-command

echo Updating repos...

#cd ..
#find . -type d | while read d; do
#   ls $d/
#   git pull
#done

cd ..
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c "cd '{}' && echo [{}]  && git pull" \;

echo Update finished
