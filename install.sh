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
bash profiles/install.sh

if [[ ${SHELL} != "/bin/zsh" ]]; then
	sudo chsh -s /bin/zsh ${USER}
fi

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
