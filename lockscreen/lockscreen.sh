#!/usr/bin/env bash

tmpbg='/tmp/lkscreen.png'
lock='/home/harwiltz/lock.png'

scrot "$tmpbg"
#convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
#convert "$tmpbg" -scale 8% -scale 1256% "$tmpbg"
convert "$tmpbg" -scale 5% -scale 2000% "$tmpbg"
convert "$tmpbg" "$lock" -gravity center -composite -matte "$tmpbg"
i3lock -u -i "$tmpbg"
