#!/bin/bash

BASE_DIR="$(realpath $(dirname ${0}))"

export SCRIPTS_DIR="${BASE_DIR}/scripts"
export INSTALL_PROG_SCRIPT="${SCRIPTS_DIR}/install-progs.sh"
export ENV_DIR="${BASE_DIR}/env"

scripts=($(ls -d ${BASE_DIR}/scripts/*.sh))

for i in "${!scripts[@]}"; do
	bash "${scripts[i]##}"
done

bash ${BASE_DIR}/profiles/install.sh
