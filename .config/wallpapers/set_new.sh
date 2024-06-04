#!/bin/bash
folder="$HOME/Documents/Wallpapers"
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
BACKGROUND_META=$(curl 'https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-US')
filename=$(echo $BACKGROUND_META | jq -r '.images[0].urlbase')
filename="${filename##*.}"
curl -o ${filename}.jpg "https://bing.com$(echo $BACKGROUND_META | jq -r '.images[0].url')"
random_file="${files[RANDOM % ${#files[@]}]}"
feh --bg-scale --no-fehbg -z -r "${random_file}"
