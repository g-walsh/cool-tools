#!/bin/bash

# A simple bash script to download subtitle files for any files in a directory
# that currently don't have subtitle files (named exactly the same). This
# script requires the cli version of the excellent tool Filebot
# (filebot.net) which is written in java. Please support their excellent work
# by donating/buying Filebot.

# To use this script yourself change /path/to/media to your media library.

# Started 29.02.2016 by Gordon Walsh (https://github.com/g-walsh)

media=/path/to/media

mkdir -p /tmp/filebot
find $media -type d > /tmp/filebot/sub_dl

for line in $(cat /tmp/filebot/sub_dl);
do
  echo $line >> /tmp/filebot/sub_log;
  filebot -get-missing-subtitles $line >> /tmp/filebot/sub_log;
done
