#!/bin/bash

echo "^/.config/nvim" >> "${STOW_IGNORE_FILE}"

FROM_DIR="${CONFIG_DIR}/nvim"
TO_DIR="${HOME}/.config/nvim"

mkdir -p "${TO_DIR}"

rm -rf "${TO_DIR}/lua"
ln -s "${FROM_DIR}/lua" "${TO_DIR}"

rm -rf "${TO_DIR}/spell"
ln -s "${FROM_DIR}/spell" "${TO_DIR}"

rm -rf "${TO_DIR}/init.lua"
ln -s "${FROM_DIR}/init.lua" "${TO_DIR}"

echo "Nvim config installed"
