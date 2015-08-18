# Created by harwiltz

autoload -U colors && colors

alias ls='ls --color=auto'
alias grep='grep -n --color=auto'
alias l='asciiquarium'

alsi -a -u
fortune -n 160 -s
echo ""

PS1="[%{$fg[yellow]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[orange]%}%~]%{$reset_color%}$ "
#color_blue='\e[0;34m'
#color_cyan='\e[0;36m'
#color_reset='\e[0m'
#export PS1="┌─[$color_blue\u$color_reset][$color_cyan\W$color_reset]\n└─▪ "

alias batterystatus='acpi'
alias showtime='tty-clock -s -c'
alias listen='mp3blaster'
alias sdmf='xinit bspwm'
alias hotkeys='vim ~/.config/sxhkd/sxhkdrc'
alias blackhawkdown='shutdown -h now'
alias updatefonts='fc-cache -vf'
alias nettest='ping -c 3 www.google.com'
alias interface='wlp3s0'
alias editvimcolors='sudo vim /usr/share/vim/vim74/colors'
alias pokerstars='C:\\Program\ Files\ (x86)\\PokerStars\\PokerStars.exe'
alias tig2d='wine ~/win32/drive_c/"Program Files"/"Tigarmageddon2D"/"Tigarmageddon 2D.exe"'

eval $(dircolors ~/.dircolors)

command_not_found_handler() {
	~/CPP/Typo/a.out
	exit 127
}
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
