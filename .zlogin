#!/usr/bin/env zsh

if [[ $TERM_PROGRAM == "iTerm.app" ]]; then
  # Mimic VSCode's clean terminal startup
  # (in iTerm clear just puts cursor at the top left, will not delete buffer)
  tput clear
  # Clear iTerm scrollback before every command
  # preexec() {
  #   tput clear
  # }
fi
