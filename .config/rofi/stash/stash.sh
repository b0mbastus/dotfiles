#!/bin/bash

INPUT=data.csv
OLDIFS=$IFS

output=()

IFS=";"
while read var data	
do
		#echo "$var: $data"
		output+=("$var: $data\n")
done < $INPUT
IFS=$OLDIFS

#echo ${output[1]}

# for entry in ${output[$i]}; do
# 	echo $entry
# done

# rofi 
#echo -e ${output[@]} | rofi -dmenu
selection=$(echo -e ${output[@]} | rofi -dmenu -format i)

echo "Do something with $selection"

echo $1

