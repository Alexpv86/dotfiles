#!/bin/bash

$(dirname ${0})/get_bing.sh
sleep 900

folder="$HOME/Documents/Wallpapers"
extensions=("jpg" "png" "bmp" "jpeg")

files=()
for ext in "${extensions[@]}"; do
	while IFS= read -r -d $'\0'; do
		files+=("$REPLY")
	done < <(find "$folder" -type f -name "*.$ext" -print0)
done

if [[ ${#files[@]} == 0 ]]; then
	exit
fi

while [[ true ]]; do
	random_file="${files[RANDOM % ${#files[@]}]}"
	feh --bg-scale --no-fehbg "${random_file}"
	sleep 900
done
