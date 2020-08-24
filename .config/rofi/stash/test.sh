#!/bin/bash

INPUT=data.csv

function show_stash() {
	OLDIFS=$IFS

	declare -a input
	output=""

	IFS=";"
	while read var data	
	do
		input+=("$var: $data")
	done < $INPUT
	IFS=$OLDIFS

	length=${#input[@]}

	for i in "${!input[@]}"
	do
		if [ $i -eq "$(($length - 1))" ]; then
			output+="${input[$i]}"
		else
			output+="${input[$i]}\n"
		fi
	done
	echo -e $output

	# rofi 
	selection=$(echo -e $output | rofi -dmenu -format i)

	# Increment index by 1 because
	# rofi gives us an index (0..N) but sed starts counting at 1 (1..N+1)
	selection="$(($selection + 1))"
	
	line=$(sed "${selection}q;d" $INPUT)
	echo -e "Do something with $selection: $line"
	echo -e $line

	# Copy to clipboard

	IFS=";"
	read -r var data <<< "$line"
	echo -n "$data" | xclip -selection c
	echo "$var"
	echo "$data"
	IFS=$OLDIFS
}

show_stash
