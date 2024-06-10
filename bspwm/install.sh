#!/bin/bash

BASE_DIR="$(realpath $(dirname ${0}))"

export ROOT_DIR="${BASE_DIR}/files"
export HOME_DIR="${ROOT_DIR}/home"
export CONFIG_DIR="${HOME_DIR}/.config"
export STOW_IGNORE_FILE="${HOME_DIR}/.stow-local-ignore"

scripts=($(ls -d ${BASE_DIR}/scripts/*.sh))
for i in "${!scripts[@]}"; do
	bash "${scripts[i]##}"
done

cd ${HOME_DIR}
stow -R -t ${HOME} .
