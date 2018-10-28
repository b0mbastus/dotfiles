#!/usr/bin/env bash

function run {
	if ! pgrep $1;
	then
		$@&
	fi
}
run compton
run nm-applet
run conky -p 1 -c ~/.config/conky/conky.conf