#!/bin/bash

mainpkg=(
	thunar
	stow
)

for pkg in ${mainpkg[@]}; do
	if [ ! paru -Qi ${pkg} ] &>/dev/null; then
		paru -S ${pkg} --noconfirm &>/dev/null

		if [ ! paru -Qi ${pkg} ] &>/dev/null; then
			echo "${pkg} is installed"
		else
			echo "ERROR: ${pkg} failed to install"
		fi
	else
		echo "${pkg} is already installed"
	fi
done
