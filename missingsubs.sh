#!/bin/bash
# A script to download missing subtitle files (using filebot) in english and
# french. This will also rename english subtitles to .en.srt from .eng.srt for
# better interpretation by Plex Media Center.

path=$1

filebot -get-subtitles $path --lang en --output srt --encoding utf8 -non-strict
filebot -get-subtitles $path --lang fr --output srt --encoding utf8 -non-strict

for i in $(find $path -type f | grep '^[^.]*\.srt');
do
  mv $i ${i/srt/en.srt};
  echo ${i/srt/en.srt}
done

for i in $(find $path -type f | grep '^[^.]*\.en.srt');
do
  echo $i
done

for i in $(find $path -type f | grep '^[^.]*\.eng.srt');
do
  mv $i ${i/eng.srt/en.srt}
  echo ${i/eng.srt/en.srt}
done

for i in $(find $path -type f | grep '^[^.]*\.fr.srt');
do
  echo $i
done
