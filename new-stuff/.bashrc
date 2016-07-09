#
# ~/.bashrc
#

# Powerline settings
export TERM=rxvt-unicode-256color

if [ -f /usr/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh ]; then
	powerline-daemon -q
	POWERLINE_BASH_CONTINUATION=1
	POWERLINE_BASH_SELECT=1
	. /usr/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
