#!/bin/bash
folder="$HOME/wallpapers/"
extensions=("jpg" "png" "bmp" "jpeg" "gif")

files=()
for ext in "${extensions[@]}"; do
	while IFS= read -r -d $'\0'; do
		files+=("$REPLY")
	done < <(find "$folder" -type f -name "*.$ext" -print0)
done

if [[ ${#files[@]} == 0 ]]; then
	exit
fi

random_file="${files[RANDOM % ${#files[@]}]}"

echo "random file: " ${random_file}
feh --bg-fill --no-fehbg "${random_file}"
