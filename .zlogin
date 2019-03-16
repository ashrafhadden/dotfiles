#!/usr/bin/env zsh

# Mimic VSCode's clean terminal startup
# (in iTerm clear just puts cursor at the top left, will not delete buffer)
if [[ $TERM_PROGRAM == "iTerm.app" ]]; then
  tput clear
fi
