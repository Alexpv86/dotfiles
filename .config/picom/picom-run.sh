#!/bin/bash

while [[ true ]]; do
	picom &>/dev/null || exit
	sleep 10
done
