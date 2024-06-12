#!/bin/bash

IFS=$'\n'
readarray mainpkg <"${ENV_DIR}/main-progs"

CHECK_CNT=0
INSTALLED_CNT=0
ERROR_CNT=0

for pkg in ${mainpkg[@]}; do
	# skeap comments
	if [[ ${pkg:0:1} == '#' ]]; then
		continue
	fi

	# skeap installed progs
	paru -Qi ${pkg} &>/dev/null
	if [[ $? == 0 ]]; then
		((CHECK_CNT++))
		continue
	fi

	paru -S ${pkg} --noconfirm --needed &>/dev/null

	paru -Qi ${pkg} &>/dev/null
	if [[ $? == 0 ]] &>/dev/null; then
		echo "${pkg} is installed"
		((INSTALLED_CNT++))
	else
		echo "ERROR: ${pkg} failed to install"
		((ERROR_CNT++))
	fi
done

echo "Установка программ:"
echo "  - проверено:   ${CHECK_CNT}"
echo "  - установлено: ${INSTALLED_CNT}"
echo "  - ошибок:      ${ERROR_CNT}"
