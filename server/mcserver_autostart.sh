#!/bin/bash
# Autostart Minecraft server

cd /home/lukas/minecraft
screen -S "Minecraft" -U -m -d java -server -Xms256M -Xmx384M -jar server.jar
