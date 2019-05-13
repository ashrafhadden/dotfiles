#!/usr/bin/env zsh
tput clear

## Auto Dark/Light iTerm Profiles
if [[ $TERM_PROGRAM == 'iTerm.app' ]]; then
  local systemAppearance=$(defaults read -g AppleInterfaceStyle 2> /dev/null)
  case $systemAppearance in
  Dark)
    printf "\033]50;SetProfile=Dracula\a"
    ;;
  *)
    printf "\033]50;SetProfile=Tango Light\a"
    ;;
  esac
fi

## Fix iTerm keys (Mac)
# https://github.com/GabLeRoux/iterm2-macos-dynamic-profile/blob/master/fix_zsh_keys.sh
bindkey "^U" backward-kill-line # changes hex 0x15 to delete everything to the left of the cursor, rather than the whole line
bindkey "^X\\x7f" backward-kill-line # binds hex 0x18 0x7f with deleting everything to the left of the cursor
bindkey "^X^_" redo # adds redo

## Imports
. ~/code/dotfiles/.exports
. $DOTS/.powerlevel10k
. $DOTS/.colors
. $DOTS/.aliases
. $DOTS/.functions
. $DOTS/.untracked
. ~/code/dotfiles/.oh-my-zsh
