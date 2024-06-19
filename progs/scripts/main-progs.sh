#!/bin/bash

IFS=$'\n'
readarray mainpkg <"${ENV_DIR}/main-progs"

CHECK_CNT=0
INSTALLED_CNT=0
ERROR_CNT=0

LOG_FILE="/tmp/dotfiles-progs.log"

echo -e "\nУстановка программ:\n"

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

	echo -n "${pkg} устанавливается..."
	paru -Sy ${pkg} --noconfirm --needed &>${LOG_FILE}

	paru -Qi ${pkg} &>/dev/null
	if [[ $? == 0 ]] &>/dev/null; then
		echo " OK"

		((INSTALLED_CNT++))
	else
		echo -e " ERROR:\n"
		cat ${LOG_FILE}
		echo

		((ERROR_CNT++))
	fi
done

rm -f ${LOG_FILE}

if ((INSTALLED_CNT > 0)); then
	echo
fi

echo "  - проверено:   ${CHECK_CNT}"
echo "  - установлено: ${INSTALLED_CNT}"
echo "  - ошибок:      ${ERROR_CNT}"
