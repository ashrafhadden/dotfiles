#!/usr/bin/env bash

source brew.sh
source macos.sh

ln -s ~/.iterm2/iterm2-macos-dynamic-profile/fix-iterm2-keys-profile.json \
  ~/Library/Application\ Support/iTerm2/DynamicProfiles

ln -s /Users/ashrafhadden/.iterm2/dracula_itermcolors/Dracula.itermcolors \
  ~/Library/Application\ Support/iTerm2/DynamicProfiles
