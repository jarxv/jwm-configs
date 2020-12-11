#!/bin/sh
umask 0022
#Ibus settings if you need them
#type ibus-setup in terminal to change settings and start the daemon
#delete the hashtags of the next lines and restart
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=dbus
#export QT_IM_MODULE=ibus
#sudo 
#my to
[[ $- != *i* ]] && return
colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}




# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
	PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac
#
use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""

## /// color //
if ${use_color} ; then
# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	if [[ ${EUID} == 0 ]] ; then
		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
	else
		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
	fi

	alias ls='ls --color=auto'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

#unset use_color safe_term match_lhs sh

# set the colour of the hostname 
#PS1="\e[0;31m[\u@\h \W]\$ \e[0m "
#export HISTCONTROL=ignoreboth:erasedups

#here  is hostname and  other texts config file
#orginal
#PS1='[\u@\h \W]\$ '
#PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '

#my
#PS1='\[\033[00;36m\][\u\[\033[00;35m\]@\h \W]\[\033[00;32m\]\$\[\033[00m\] '
#PS1='\[\033[01;32m\] \W$ \[\033[00m\]'
#PS1='\[\033[01;32m\] \W $ \[\033[00m\]'
PS1=' \[\033[01;32m\][\[\033[01;37m\] \W\[\033[01;32m\] \$ ] \[\033[00m\]'

#PS1='\[\033[01;36m\]-\[\033[01;35m\]>> \[\033[01;36m\]\W\[\033[00;32m\]\$\[\033[00m\] '
#PS1='\[\033[01;32m\][\u\[\033[01;31m\]@\h \W\[\033[01;36m\]]\[\033[01;31m\]\$\[\033[00m\] '


 #for root
#PS1='\e~[1;31m->> \W$ \e[m'
#create a file called .bashrc-personal and put all your personal aliases
#in there. They will not be overwritten by skel.
#HORIZONTAL=600
#VERTICAL=380
#wmctrl -r ":ACTIVE:" -e 0,-1,-1,${HORIZONTAL},${VERTICAL}

#neofetch



#bspc node -t pseudo_tiled
#case $TERM in
#   linux) LANG=C ;;
#    *) LANG=ja_JP.UTF-8 ;;
#esac
# export GTK_IM_MODULE=ibus
# export XMODIFIERS=@im=ibus
# export QT_IM_MODULE=ibus
#LANG=ja_JP.SHIFT_JIS 

[ -r /etc/default/locale ] && . /etc/default/locale
export LANG LANGUAGE LC_MESSAGES LC_ALL
#killall -q  dbus-launch  dbus-daemon 
#killall -q dbus-launch  dbus-daemon 
#killall -q dbus-launch  dbus-daemon 

#export PATH=/usr/bin:/bin:/usr/local/bin:$HOME/.local/bin:~/my\ scripts:~/.local:$HOME/scripttest

export PATH=/sbin/:/media/jerome/AS/git/.linuxbrew/bin:/media/jerome/AS/git/.linuxbrew/sbin:/usr/bin:/bin:/usr/local/bin:$HOME/.local/bin:$HOME/my\ scripts:$HOME/.local:$HOME/scripttest:$HOME/my\ scripts/:$HOME/scripttest/:$HOME/.local/bin/:/opt/megacmd/usr/bin/

#export PYTHONPATH="${PYTHONPATH}:/opt/bin/pip/python"
##  bash completion
for f in ~/.local/etc/bash_completion.d/* ; do . $f; done
.  /usr/share/bash-completion/bash_completion 
. ~/.local/etc/bash_completion.d/youtube-dl.bash-completion
. ~/.config/.alias
#.  ~/.config/.path
. /etc/profile.d/bash_completion.sh 


set disable-completion off
#dotnet
export COMPlus_GCRetainVM=1
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="$HOME/.sdkman"
#[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
