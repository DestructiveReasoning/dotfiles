#!/bin/sh

KEYS="/home/harwiltz/.dzen/PianoKeysIcon.xbm"
TREBLE="/home/harwiltz/.dzen/Treble.xbm"
PAUSED="/home/harwiltz/.dzen/Paused.xbm"
PAUSED2="/home/harwiltz/.dzen/Paused2.xbm"
STOPPED="/home/harwiltz/.dzen/Stopped.xbm"
HW="/home/harwiltz/.dzen/HW.xbm"
SPEAKER="/home/harwiltz/.dzen/Speaker.xbm"
SPEAKER2="/home/harwiltz/.dzen/Speaker2.xbm"
MUTED="/home/harwiltz/.dzen/Muted.xbm"
WORKSPACE1="/home/harwiltz/.dzen/Workspace1.xbm"
WORKSPACE2="/home/harwiltz/.dzen/Workspace2.xbm"
WORKSPACE2FREE="/home/harwiltz/.dzen/Workspace2Free.xbm"
UNDERLINE="/home/harwiltz/.dzen/Underline.xbm"
TWO=2

SCREENWIDTH=1920.0
WREL=0.9
WIDTH=$(echo "${SCREENWIDTH}*${WREL}" |bc)
X=$(echo "${SCREENWIDTH}/2 -${WIDTH}/2" |bc)

clock() {
	cal=$(date +'%l:%M:%S %p')
	clo=$(date +'%a, %b %_d')
	location=310*16

	echo -ne "^p(_RIGHT)^p(-$location)^fg(#aaaaaa)$cal | $clo^fg()"
}

workspaces() {
	color_focus=#aaaa00
	color_normal=#444444
	color_busy=#aaaaaa
	names=(" I  " " II " "III " " IV " " V  " " VI " " VII" "VIII" " IX " "  X ")
	line=""
	i=0

	busy=0

	for workspace in $(bspc query -D); do
		busy=0
		icon=$WORKSPACE2FREE
		if [[ $(bspc query -W -d ${workspace}.occupied) ]]; then
			busy=1
			icon=$WORKSPACE2
		fi

		if [[ $workspace = $(bspc query -d -D) ]]; then
			line="${line} ^fg($color_focus)^i($icon)"
		else
			if [[ $busy = 1 ]]; then
				line="${line} ^fg($color_busy)^i($WORKSPACE2)"
			else
				line="${line} ^fg($color_normal)^i($WORKSPACE2FREE)"
			fi
		fi

		i=$(echo "${i} + 1")
	done

	echo -ne "^p(_LEFT)^p(0)${line}^fg()"
}

wifi() {
	color_con=#66bb66
	color_off=#333333
	color_side=#aaaaaa
	location=680*16
	size=10
	total=70
	connection=$(iwconfig wlp3s0 | grep "Link Quality" | grep -P -o "[0-9]+/" | sed 's/\///')
	noconnection=0
	
	if [[ $connection ]]; then
		color_side=#aaaaaa
	else 
		color_side=#ff2222
		noconnection=1
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
	location=500*16
	size=10
	muted=0
	speakericon=$SPEAKER #Choose between $SPEAKER1 and $SPEAKER2
	vol=$(amixer get Master | grep 'Mono:' | grep -P -o "[0-9]+%" | sed 's/.$//') #Get Master volume percentage, remove the trailing bracket


	if [[ $vol = "" ]]; then
		vol=$(amixer get Master | grep 'Front Left:' | grep -P -o "[0-9]+%" | sed 's/.$//') #Different volume configurations
	fi
	
	if [[ $vol = 0 ]]; then
		color_side=#ff2222
		muted=1
	fi

	vol=$(expr $vol / $size)
	vol=$(echo $vol | sed -r 's/\.[0-9]+//') #Floor the volume ratio
	off=$(expr $size - $vol)
	
	line="^p(_RIGHT)^p(-$location)"
	
	if [[ $(amixer get Speaker | grep 'Unable') ]]; then #If the Speaker is found...
		speakervol=$(amixer get Speaker | grep "off")
		if [[ $(amixer get Speaker | grep "off") ]]; then #Speaker is muted...
			line="${line}^fg(#ff9999)^i($MUTED) ^fg()"
		else                            #Speaker is not muted...
			line="${line}^i($speakericon) "	
		fi
	else 
		if [[ $muted = "1" ]]; then
			line="${line}^fg(#ff9999)^i($MUTED) ^fg()"
		else
			line="${line}^i($speakericon) "	
		fi
	fi


	line="${line}^fg($color_side)Master: [^fg($color_vol)"

	for i in `seq 1 $vol`;
	do
		line="${line}|"
	done

	line="${line}^fg($color_off)"

	vol=$(expr $vol + 1)

	for i in `seq $vol  $size`; 
	do
		line="${line}|"
	done

	line="${line}^fg($color_side)]"

	echo -ne "${line}"
}

volume2() {
	color_vol=#444477
	color_off=#333333
	color_side=#aaaaaa
	location=500*16
	size=10
	speakericon=$SPEAKER
	line="^p(_RIGHT)^p(-$location)"

	if [[ $(amixer get Master | grep '\[off\]') ]]; then
		color_side=#ff2222
		speakericon=$MUTED
		line="${line}^i($speakericon) Master: ^fg($color_side)["
		for i in `seq 1 $size`;
		do
			line="${line}^fg($color_off)|"
		done
		line="${line}^fg($color_side)]"
		echo -ne "${line}"
		return
	fi

	vol=$(amixer get Master | grep 'Front Left:' | grep -P -o "[0-9]+%" | sed 's/.$//')
	if [[ $vol ]]; then # if volume in config 2
		vol=$(expr $vol / $size)
		vol=$(echo $vol | sed -r 's/\.[0-9]+//') #Floor the volume ratio
		off=$(expr $size - $vol)
		
		line="${line}^i($speakericon) Master: ^fg($color_side)["
		for i in `seq 1 $vol`;
		do 
			line="${line}^fg($color_vol)|"
		done
		for i in `seq 1 $off`; do
			line="${line}^fg($color_off)|"
		done
		line="${line}^fg($color_side)]"
		echo -ne "${line}"
		return

	else # if no volume
		color_side=#ff2222
		line="${line}^fg($color_side)["
		for i in `seq 1 $size`;
		do
			line="${line}^fg($color_off)|"
		done
		line="${line}^fg($color_side)]"
		echo -ne "${line}"
		return
	fi
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
		line="${line}^i($PAUSED2) ^fg($pausedcolor)${songinfo}^fg()"
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
	volume2
	wifi
	music
	battery
	sleep 0.5
done | dzen2 -e - -h '26' -fn 'Tamsyn-14' -w "${WIDTH}" -x "${X}" 
