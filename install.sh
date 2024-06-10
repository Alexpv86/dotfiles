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
	kbdd
	bat

	picom
	rofi # menu
	polybar
	alacritty # terminal
	stow      # config manager
	xfce-polkit

	warpd # Mouse emulator

	# Neovim
	neovim-git
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
	unzip
	unrar
	xarchiver

	yandex-browser

	virtualbox-guest-utils
	lazygit
	feh
	gtest
	tmux
	gcovr
	bear

	valgrind
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

./profiles/install-profiles.sh

sudo rm /etc/environment
sudo rm /etc/pacman.conf
stow -D -v home/
stow -v home/
sudo stow -D -v -t / root/
sudo stow -v -t / root/

sudo chsh -s /bin/zsh $USER

git config --global user.email "typewria@student.21-school.ru"
git config --global user.name "typewria"

localectl --no-convert set-x11-keymap us,ru

export SUDO_FILE="/etc/sudoers.d/00_$USER"
export SUDO_STR="$USER ALL= NOPASSWD: /usr/bin/systemctl suspend"
sudo grep -qF "$SUDO_STR" "$SUDO_FILE" || sudo -E bash -c 'echo "$SUDO_STR" >> $SUDO_FILE'
SUDO_STR="$USER ALL= NOPASSWD: /usr/bin/wg-quick"
sudo grep -qF "$SUDO_STR" "$SUDO_FILE" || sudo -E bash -c 'echo "$SUDO_STR" >> $SUDO_FILE'
SUDO_STR="$USER ALL= NOPASSWD: /usr/bin/reboot"
sudo grep -qF "$SUDO_STR" "$SUDO_FILE" || sudo -E bash -c 'echo "$SUDO_STR" >> $SUDO_FILE'

cp -rf .local/share/* ~/.local/share/
