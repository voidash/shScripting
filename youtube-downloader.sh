#!/bin/bash

#main motive to download mp3 Music, mp4 videos and playlist

#1st argument takes type of file to download

if [ $# -lt 1 ]
then
        echo "usage youtube-downloader <url>  <filetype>(opt)  directory>(opt)"
        echo "File type supported are : video , mp3 and playlist"
        echo "default directory is /media/$USER/New Volume1 "
        exit
fi
URL=$1
DIR="/media/$USER/New Volume1"
FILENAME="video"
if [ $2 ]
then
        FILENAME="mp3"
fi
case $FILENAME in
        video)
                youtube-dl -f 22 -o "$DIR/%(uploader)s/%(title)s.%(ext)s" "$URL"
        ;;
        mp3)
                youtube-dl --extract-audio --audio-format mp3 -o "$DIR/%(uploader)s/%(title)s.%(ext)s"  "$URL"
        ;;
        playlist)
                youtube-dl -i -f 22 --yes-playlist -o "$DIR/%(uploader)s/%(playlist)s/%(title)s.%(ext)s" "$URL"
        ;;
        *)
                echo "unknown file type. supported are video , mp3 and playlist"
        ;;
esac


