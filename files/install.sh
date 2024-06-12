#!/bin/bash

BASE_DIR="$(realpath $(dirname ${0}))"

export ROOT_DIR="${BASE_DIR}/root"
export HOME_DIR="${ROOT_DIR}/home"
export CONFIG_DIR="${HOME_DIR}/.config"

export STOW_IGNORE_FILE="${HOME_DIR}/.stow-local-ignore"
echo -n >${STOW_IGNORE_FILE}
export STOW_IGNORE_ROOT_FILE="${ROOT_DIR}/.stow-local-ignore"
echo -n >${STOW_IGNORE_ROOT_FILE}

scripts=($(ls -d ${BASE_DIR}/scripts/*.sh))
for i in "${!scripts[@]}"; do
	bash "${scripts[i]##}"
done

echo ".local" >>${STOW_IGNORE_FILE}
cd ${HOME_DIR}
stow -R-t ${HOME} .
echo "Home config stowed."

sudo rm -f /etc/environment
sudo rm -f /etc/pacman.conf
echo "^/home" >>${STOW_IGNORE_ROOT_FILE}
cd ${ROOT_DIR}
sudo stow -R -t / .
echo "Root config stowed."

bash "${BASE_DIR}/profiles/install.sh"
