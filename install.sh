#!/bin/bash

if [[ ! $(command -v paru) ]]; then
	git clone https://aur.archlinux.org/paru-bin.git
	cd paru-bin || exit
	makepkg -si
	cd ..
	rm -rf paru-bin
fi

mainpkg=(
	# Fonts
	ttf-jetbrains-mono
	ttf-jetbrains-mono-nerd
	ttf-nerd-fonts-symbols
	awesome-terminal-fonts

	# System
	lxappearance
	qt5ct
	man-db
	xorg-xrandr
	zsh
	lsd
	xkb-switch
	xorg-xsetroot

	picom
	rofi # menu
	polybar
	alacritty # terminal
	stow      # config manager

	warpd # Mouse emulator

	# Neovim
	neovim
	xclip
	ripgrep
	fd
	jq

	# Thunar (explorer)
	thunar
	thunar-volman
	thunar-archive-plugin
	thunar-media-tags-plugin
	gvfs
	tumbler

	yandex-browser

	virtualbox-guest-utils
	lazygit
	feh
	gtest
)

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

echo
echo "Install config files"
sudo rm /etc/environment
stow -D -v .
stow -v .
sudo stow -D -v -t / root/
sudo stow -v -t / root/

chsh -s /bin/zsh

git config --global user.email "typewria@student.21-school.ru"
git config --global user.name "typewria"

cp -rf .local/share/* ~/.local/share/
