#!/bin/bash

PROFILES_DIR="$(realpath $(dirname ${0}))"
PROFILES=($(find ${PROFILES_DIR}/* -maxdepth 0 -type d))

if [[ ${#PROFILES[@]} == 1 ]]; then
	bash "${PROFILES[0]}/install.sh"
elif [[ ${#PROFILES[@]} > 1 ]]; then
	echo
	echo "Доступные профили для установки программ:"
	echo "-----------------------------------------"
	for i in "${!PROFILES[@]}"; do
		echo "$((i + 1)). ${PROFILES[i]##*/}"
	done
	echo "-----------------------------------------"
	echo "q. ->Выход<-"

	if [[ ${#PROFILES[@]} < 9 ]]; then
		READ_ARGS="-n1"
	fi

	while true; do
		echo
		read ${READ_ARGS} -p "Введите номер выбранного варианта: " choice
		echo

		if ! [[ "$choice" =~ ^[0-9]+$ ]]; then
			if [ "$choice" = "q" ]; then
				echo
				break
			fi
		elif [ "$choice" -ge 1 ] && [ "$choice" -le "${#PROFILES[@]}" ]; then
			export PROFILE_DIR="${PROFILES[$((choice - 1))]}"
			bash "${PROFILE_DIR}/install.sh"
			break
		fi

		echo "Неверный выбор. Попробуйте еще раз: "
	done
fi
