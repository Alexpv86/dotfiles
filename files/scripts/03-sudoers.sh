#!/bin/bash

sudo chown root:wheel ${ROOT_DIR}/etc/sudoers.d/99_wheel
sudo chmod 640 ${ROOT_DIR}/etc/sudoers.d/99_wheel
