#!/bin/bash

$(dirname ${0})/get_bing.sh
sleep 900

folder="$HOME/Wallpapers"
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
	feh --bg-center --no-fehbg "${random_file}" &>/dev/null || exit
	sleep 900
done
