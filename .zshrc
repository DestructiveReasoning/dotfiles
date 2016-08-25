# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _correct
zstyle ':completion:*' file-sort name
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/harwiltz/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# Created by harwiltz

autoload -U colors && colors

alias ls='ls --color=auto'
alias grep='grep -n --color=auto'
alias l='asciiquarium'

alsi -a -u
fortune -a -n 160 -s
echo ""

bindkey '^?' backward-delete-char

success() {
	RESULT=\$?
	if [ $RESULT == 0 ]; then
		echo "✓"
	else
		echo "✘"
	fi
}
#PS1="\[\033[ 01;37m\]\$(exit=\$?; if [[ \$exit == 0 ]]; then echo \"\[\033[01;32m\]✓\"; else echo \"\[\033[01;31m\]✗ \$exit\"; fi) \[\033[01;32m\]\u\[\033[01;34m\] \W \$\[\033[00m\] "

#CHECKMARKS
#PS1="%(?.%{$fg_bold[green]%}✓ .%{$fg_bold[red]%}✗ %? )%{$reset_color%}%{$fg_bold[yellow]%}%n@%{$fg_bold[magenta]%}%M%{$reset_color%} %{$fg_bold[blue]%}%~ $ %{$reset_color%}"

#LAMBDA
#PS1="%(?.%{$fg[green]%}λ .%{$fg[red]%}λ %? )%{$reset_color%}%{$fg_bold[yellow]%}%n@%{$fg_bold[magenta]%}%M%{$reset_color%} %{$fg_bold[blue]%}%~ $ %{$reset_color%}"

#MUSIC
PS1="%(?.%{$fg_bold[green]%} ♮ .%{$fg[red]%} ♯ %? )%{$reset_color%}%{$fg_bold[yellow]%}%n@%{$fg_bold[magenta]%}%M%{$reset_color%} %{$fg_bold[blue]%}%~ $ %{$reset_color%}"

#DIRAC NOTATION
PS1="%{$fg_bold[yellow]%}%n@%{$fg_bold[magenta]%}%M%{$reset_color%} %{$fg_bold[blue]%}%~ %(?.%{$fg_bold[green]%}│Ψ 〉.%{$fg[red]%}♯ %? )%{$reset_color%}%{$reset_color%}"

#PS1="$(result=\$?; if [[ result == 0 ]]; then echo "✓"; else echo "✘"; fi)[%{$fg[yellow]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[orange]%}%~]%{$reset_color%}$ "
#color_blue='\e[0;34m'
#color_cyan='\e[0;36m'
#color_reset='\e[0m'
#export PS1="┌─[$color_blue\u$color_reset][$color_cyan\W$color_reset]\n└─▪ "

alias batterystatus='acpi'
alias showtime='tty-clock -s -c -b'
alias listen='mp3blaster'
alias sdmf='xinit bspwm'
alias hotkeys='vim ~/.config/sxhkd/sxhkdrc'
alias blackhawkdown='shutdown -h now'
alias updatefonts='fc-cache -vf'
alias nettest='ping -c 3 www.google.com'
alias interface='wlp3s0'
alias editvimcolors='sudo vim /usr/share/vim/vim74/colors'
alias pokerstars='C:\\Program\ Files\ (x86)\\PokerStars\\PokerStars.exe'
#alias tig2d='wine ~/win32/drive_c/"Program Files"/"Tigarmageddon2D"/"Tigarmageddon 2D.exe"'
alias please='sudo $(fc -lnr -1)'
alias gtfo='xrdb -load .Xdefaults && xrdb -merge .Xdefaults && exit'
alias rstream='~/CPP/rstream/rstream'
alias copy="nohup termite -d $PWD &"

export LESS='-R'

eval $(dircolors ~/.dircolors)

setopt AUTO_CD
#setopt CORRECT

command_not_found_handler() {
	~/CPP/Typo/a.out
	exit 127
}

#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
