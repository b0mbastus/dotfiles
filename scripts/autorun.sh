#!/usr/bin/env bash

source ${HOME}/system.sh

function run {
	if ! pgrep $1;
	then
		$@&
	fi
}
run compton
run conky -p 1 -c ~/.config/conky/conky.conf

if [[ $SYSTEM == "Laptop" ]]; then
		run nm-applet
		run cbatticon
fi
