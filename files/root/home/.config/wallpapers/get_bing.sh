#!/bin/bash
folder="$HOME/Wallpapers"

BACKGROUND_META=$(curl 'https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-US')
filename=$(echo $BACKGROUND_META | jq -r '.images[0].urlbase')
filename="${folder}/${filename##*.}.jpg"

if ! [[ -f ${filename} ]]; then
	curl -o ${filename} "https://bing.com$(echo $BACKGROUND_META | jq -r '.images[0].url')"
fi

feh --bg-center --no-fehbg "${filename}"
