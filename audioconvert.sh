#!/bin/bash

# Script for converting folder of music to .aac
# first run just for a local flac album into an /aac directory

mkdir -p ./mp3

for f in *.flac;
   do ffmpeg -i "$f" -acodec mp3 "./mp3/${f%.flac}.mp3";
done
