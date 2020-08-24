#!/bin/bash

INPUT=data.csv

function show_stash() {
	OLDIFS=$IFS

	output=()

	IFS=";"
	while read var data	
	do
		#echo "$var: $data"
		output+=("$var: $data\n")
	done < $INPUT
	IFS=$OLDIFS

	# for entry in ${output[$i]}; do
	# 	echo $entry
	# done

	# rofi 
	#echo -e ${output[@]} | rofi -dmenu
	selection=$(echo -e ${output[@]} | rofi -dmenu -format i)

	# Increment index by 1 because
	# rofi gives us an index (0..N) but sed starts counting at 1 (1..N+1)
	selection="$(($selection + 1))"
	
	line=$(sed "${selection}q;d" $INPUT)
	echo "Do something with $selection: $line"

	# Copy to clipboard

	IFS=";"
	read -r var data <<< "$line"
	echo "$data" | xclip
	echo "$var"
	echo "$data"
	IFS=$OLDIFS
}

# Returns the index of the key or -1 if key does not exist
function find_key() {
	key=$1
	echo "Find key $1"
}

function exists_key {
	key=$1
	result_count=$(grep ${key} $INPUT | wc -l)
	echo "Exists key $1 = $result_count"
	if [ $result_count -gt 0 ]; then
		return 1
	fi
	return 0
}

function set_key() {
	key=$1
	val=$2
	echo "$key;$val" >> $INPUT
	echo "Set key $1 to val $2"
}

function del_key() {
	key=$1
	sed -i "/^${key};/d" $INPUT
	echo "Deleted key $1"
}

# If argument 1 is not present or emtpy
if [ "$1" == "" ] || [ $# -eq 0 ]; then
	show_stash
elif [ "$1" == "set" ] && [ "$2" != "" ] && [ $# == 3 ]; then
	# Check if exists
	exists_key $2
	if [ "$?" != "0" ]; then
		# Delete Key
		del_key $2
	fi
	# Create Key
	set_key $2 $3
elif [ "$1" == "del" ] && [ "$2" != "" ] && [ $# == 2 ]; then
	# Check if exists
	exists_key $2
	if [ "$?" != "0" ]; then
		# Delete key
		del_key $2
	fi
else
	# Unknown command
	echo "Unknown command!"
	echo "Usage:"
	echo "stash - for searching and copying a value from the stash"
	echo "stash set <var> <value> - for setting a variable to a value"
	echo "stash del <var> - deletes the variable from the stash if it exists"
fi

