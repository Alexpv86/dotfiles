#!/bin/bash

if [[ ! $(command -v paru) ]]; then
	git clone https://aur.archlinux.org/paru-bin.git
	cd paru-bin || exit
	makepkg -si
	cd ..
	rm -rf paru-bin
fi

echo
echo "Install config files"
bash files/install.sh
bash progs/install.sh

if [[ ${SHELL} != "/bin/zsh" ]]; then
	sudo chsh -s /bin/zsh ${USER}
fi

git config --global user.email "typewria@student.21-school.ru"
git config --global user.name "typewria"

localectl --no-convert set-x11-keymap us,ru
