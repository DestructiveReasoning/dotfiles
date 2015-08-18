export EDITOR=vim

#[LXDE]
#exec startlxde

#[BSPWM]
#sxhkd &
#feh -x --bg-scale ~/Pictures/space-wallpaper.jpg &
#xsetroot -cursor_name left_ptr
#tint2 &
#xfce4-panel &
#exec bspwm

case $1 in
	bspwm)
		echo "Starting bspwm..."
		compton -b -z -c -r 32 -o 0.75 -f -D 5 -i 0.85 &
		sxhkd &
		conky -db
		feh -x --bg-scale ~/Pictures/ArchBlueNebula.png &
		xsetroot -cursor_name left_ptr
		tint2 &
		exec bspwm
		;;

	kde)
		echo "Starting kde..."
		exec startkde
		;;

	xfce)
		echo "Starting XFCE..."
		exec startxfce4
		;;
		
	xmonad)
		echo "Starting xmonad..."
		feh -x --bg-scale ~/Pictures/XMonadWallpaper.png &
		xsetroot -cursor_name left_ptr
		exec xmonad	
		;;

	subtle)
		echo "Starting subtle..."
		compton -b -z -c -r 32 -o 0.75 -f -D 5 -i 0.85 &
		exec subtle
		;;

	*)
		echo "Invalid entry... Starting XFCE"
		exec startxfce4
		;;
esac
