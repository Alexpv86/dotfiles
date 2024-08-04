#!/bin/bash

cd "$HOME/wallpapers"

BACKGROUND_META=$(curl 'https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-US')
filename=$(echo $BACKGROUND_META | jq -r '.images[0].urlbase')
filename="${filename##*.}_$(date +%Y%m%d).jpg"

if ! [[ -f ${filename} ]]; then
	curl -o ${filename} "https://bing.com$(echo $BACKGROUND_META | jq -r '.images[0].url')"
fi

if [[ $(git status --porcelain) ]]; then
	git pull
	git add ${filename}
	git commit -m "auto commit"
	git push
fi

feh --bg-fill --no-fehbg "${filename}"
