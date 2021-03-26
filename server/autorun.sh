#!/bin/sh
# This script automatically updates and upgrades packets on linux machines using the apt packet manager.

sudo apt update
sudo apt install -f -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo apt autoclean
