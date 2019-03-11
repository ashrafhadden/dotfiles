#!/usr/bin/env zsh

# Mimic VSCode's clean terminal startup
if [[ $TERM_PROGRAM == "iTerm.app" ]]; then
  tput clear
fi
