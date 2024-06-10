#!/bin/bash

# Путь к папке, где находятся подпапки
dir_path="$PWD/other"

# Путь к папке, куда будут копироваться файлы
dest_path="$HOME/.config/additional"

# Получение списка подпапок
subdirs=($(ls -d "$dir_path"/*))

# Вывод вариантов для пользователя
for i in "${!subdirs[@]}"; do
	echo "$((i + 1)). ${subdirs[i]##*/}"
done
echo "q. Выход"

while true; do
	# Чтение выбора пользователя
	echo
	read -p "Введите номер выбранного варианта: " choice

	# Проверка выбора пользователя и копирование соответствующей папки
	if ! [[ "$choice" =~ ^[0-9]+$ ]]; then
		if [ "$choice" = "q" ]; then
			break
		fi
	elif [ "$choice" -ge 1 ] && [ "$choice" -le "${#subdirs[@]}" ]; then
		# mkdir -p "$dest_path"
		# cp -r "${subdirs[$((choice - 1))]}"/* "${subdirs[$((choice - 1))]}"/.* "$dest_path" 2>/dev/null
		ln -sf "${subdirs[$((choice - 1))]}" "$dest_path"
		echo "Необходимые файлы из ${subdirs[$((choice - 1))]} скопированы в $dest_path"
		break
	fi

	echo "Неверный выбор. Попробуйте еще раз: "
done
