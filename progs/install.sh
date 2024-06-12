#!/bin/bash

BASE_DIR="$(realpath $(dirname ${0}))"

export ENV_DIR="${BASE_DIR}/env"

scripts=($(ls -d ${BASE_DIR}/scripts/*.sh))

for i in "${!scripts[@]}"; do
	bash "${scripts[i]##}"
done
