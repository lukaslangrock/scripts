#!/bin/sh
# Made to autorun on a PirateBox
# This script will automatically sort uploaded files

cd /opt/piratebox/share/Shared
sudo mv *.png Images/
sudo mv *.jpg Images/
sudo mv *.jpeg Images/
sudo mv *.webp Images/
sudo mv *.avif Images/
sudo mv *.jxl Images/
sudo mv *.mp4 Videos/
sudo mv *.m4v Videos/
sudo mv *.mov Videos/
sudo mv *.mkv Videos/
sudo mv *.webm Videos/
sudo mv *.mp3 Music/
sudo mv *.m4a Music/
sudo mv *.aac Music/
sudo mv *.opus Music/
sudo mv *.flac Music/
sudo mv *.mka Music/
