#!/bin/bash

mainpkg=(
	thunar
	stow
)

for pkg in ${mainpkg[@]}; do
	paru -Qi ${pkg} &>/dev/null

	if [[ $? == 1 ]] &>/dev/null; then
		paru -S ${pkg} --noconfirm &>/dev/null

		paru -Qi ${pkg} &>/dev/null
		if [[ $? == 0 ]] &>/dev/null; then
			echo "${pkg} is installed"
		else
			echo "ERROR: ${pkg} failed to install"
		fi
	else
		echo "${pkg} is already installed"
	fi
done

echo
echo "Install config files"
stow -D -v .
stow -v .
sudo stow -D -v -t / root/
sudo stow -v -t / root/
