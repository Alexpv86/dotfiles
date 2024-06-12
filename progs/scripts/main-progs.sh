#!/bin/bash

readarray mainpkg <"${ENV_DIR}/main-progs"

for pkg in ${mainpkg[@]}; do
	paru -Qi ${pkg} &>/dev/null

	if [[ $? == 1 ]] &>/dev/null; then
		paru -S ${pkg} --noconfirm --needed &>/dev/null

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
