#!/bin/sh

KEYS="/home/harwiltz/.dzen/PianoKeysIcon.xbm"
TREBLE="/home/harwiltz/.dzen/Treble.xbm"
PAUSED="/home/harwiltz/.dzen/Paused.xbm"
STOPPED="/home/harwiltz/.dzen/Stopped.xbm"
HW="/home/harwiltz/.dzen/HW.xbm"

clock() {
	cal=$(date +'%l:%M:%S %p')
	clo=$(date +'%a, %b %_d')
	location=310*16

	echo -ne "^p(_RIGHT)^p(-$location)^fg(#aaaaaa)$cal | $clo"
}

workspaces() {
	color_focus=#ffff00
	color_normal=#995555
	names=("I" "II" "III" "IV" "V" "VI" "VII" "VIII" "IX" "X")
#names=(" I  " " II " "III " " IV " " V  " " VI " "VII " "VIII" " IX " "  X")
	location=64
	line="^p(_LEFT)^p(-$location)"
	cur=$(ratpoison -c groups | grep '*' | head -c 1)

	for i in `seq 0 9`;
	do
		if [[ $i = $cur ]]; then
			line="${line}^fg($color_focus)${names[$i]} "
		else 
			line="${line}^fg($color_normal)${names[$i]} "
		fi
	done

	echo -ne "^bg(#220b0b)${line}^bg()"
}

wifi() {
	color_con=#66bb66
	color_off=#333333
	color_side=#aaaaaa
	location=650*16
	size=10
	total=70
	connection=$(iwconfig wlp3s0 | grep "Link Quality" | grep -P -o "[0-9]+/" | sed 's/\///')
	
	if [[ $connection = 0 ]]; then
		color_side=#ff2222
	fi

	let "connection = $connection * 10"
	connection=$(echo $connection | sed -r 's/\.[0-9]+//')
	connection=$(expr $connection / $total)
	off=$(expr $size - $connection)
	line="^p(_RIGHT)^p(-$location)^fg($color_side)wlp3s0: [^fg($color_con)"

	for i in `seq 1 $connection`;
	do
		line="${line}|"
	done

	line="${line}^fg($color_off)"

	for i in `seq $connection $size`;
	do
		line="${line}|"
	done

	line="${line}^fg($color_side)]"

	echo -ne "${line}"
}

volume() {
	color_vol=#444477
	color_off=#333333
	color_side=#aaaaaa
	location=470*16
	size=10
	vol=$(amixer get Master | grep 'Mono:' | grep -P -o "[0-9]+%" | sed 's/.$//')
	
	if [[ $vol = 0 ]]; then
		color_side=#ff2222
	fi

	vol=$(expr $vol / $size)
	vol=$(echo $vol | sed -r 's/\.[0-9]+//')
	off=$(expr $size - $vol)
	line="^p(_RIGHT)^p(-$location)^fg($color_side)Master: [^fg($color_vol)"

	for i in `seq 1 $vol`;
	do
		line="${line}|"
	done

	line="${line}^fg($color_off)"

	for i in `seq 1 $off`; 
	do
		line="${line}|"
	done

	line="${line}^fg($color_side)]"

	echo -ne "${line}"
}

music() {
	state=$(mpc | grep -P -o "\[[a-z]+\]")
	location=250

	pausedcolor=#444477
	playingcolor=#9999ff

	line="^p(_LEFT)^p($location)"
	
	if [[ $state = "[playing]" ]]; then
		songinfo=$(mpc | head -n1)
		line="${line}^i($TREBLE) ^fg($playingcolor)${songinfo}^fg()"
	elif [[ $state = "[paused]" ]]; then
		songinfo=$(mpc | head -n1)
		line="${line}^i($PAUSED) ^fg($pausedcolor)${songinfo}^fg()"
	else 
		line="${line}^i($STOPPED) No music playing"
	fi

	echo -ne "${line}"
}

logo() {
	echo -ne "^p(_LEFT)^p(-128)^fg(#ffff00)^i($HW)^fg()"
}

battery() {
	cap=$(cat /sys/class/power_supply/BAT1/capacity)
	location=100*16

	if [[ $(cat /sys/class/power_supply/BAT1/status) = "Charging" ]]; then
		echo "^p(_RIGHT)^p(-$location)^fg(#00aa00)[$cap%]"
	else
		echo "^p(_RIGHT)^p(-$location)^fg(#ff0000)[$cap%]"
	fi
}


while true; do
	clock
	workspaces
	volume
	wifi
	music
	battery
	sleep 0.1
done | dzen2 -e - -h '24' -fn 'Tamsyn-16'
