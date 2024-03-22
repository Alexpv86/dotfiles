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

	picom
	rofi # menu
	polybar
	alacritty # terminal
	stow      # config manager

	warpd

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
stow -D -v .
stow -v .
sudo stow -D -v -t / root/
sudo stow -v -t / root/
