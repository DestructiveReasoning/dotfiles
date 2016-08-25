#!/bin/sh

lines=4
width=1928

#fgcol="#444444"
fgsel="#FFFF00"
fgcol="#888888"
#fgcol="#444466"
bgcol="#050505"
bgsel="#000000"
#bgalt="#0a0a0a"

border="#444444"
borderwidth=4
opacity=90

font="Dejavu Sans Mono 14"

padding=480

#rofi -show run -terminal urxvt -eh 2 -lines $lines -width 100 -opacity $opacity -bg $bgcol -fg $fgcol -hlbg $bgcol -hlfg $fgsel -bc $bgcol -bw 0 -font "Tamsyn 14" -padding $padding -rnow -color-window $bgcol -separator-style "solid"
#rofi -show run -terminal urxvt -eh 2 -line $lines -width 100 -opacity $opacity -color-window $bgcol -color-normal $bgcol -fg $fgcol -bw 0 -font "Tamsyn 14" -padding $padding 
rofi -show run -terminal urxvt -eh 2 -line $lines -width 100 -opacity $opacity -color-window "#080811,#080811" -color-normal "#080811,#444477,#080811,#080811,#FFFF00" -bw 0 -font "Tamsyn 14" -padding $padding
