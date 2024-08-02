#!/bin/bash
folder="$HOME/wallpapers"

BACKGROUND_META=$(curl 'https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-US')
filename=$(echo $BACKGROUND_META | jq -r '.images[0].urlbase')
filename="${folder}/${filename##*.}_$(date +%Y%m%d).jpg"

if ! [[ -f ${filename} ]]; then
	curl -o ${filename} "https://bing.com$(echo $BACKGROUND_META | jq -r '.images[0].url')"
fi

feh --bg-fill --no-fehbg "${filename}"
