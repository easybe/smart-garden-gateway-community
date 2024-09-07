#!/bin/sh
set -e

#export SSTATE_DIR=~/.cache/yocto/sstate-cache

rm -rf build

# Build everyting
kas build mt7688.yml
kas build at91sam.yml

# Make sure only recipes in this repo are in the package index
rm -rf build/tmp/deploy
kas build mt7688.yml -c clean
kas build at91sam.yml -c clean
kas build mt7688.yml
kas build at91sam.yml
