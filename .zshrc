#!/usr/bin/env zsh
tput cl

function zshaddhistory() {
  if ! [[ $1 =~ ^(git commit -m) ]]; then
    print -sr -- ${1%%$'\n'}
    fc -p
  else
    printf "⚠️  Did not add \`git commit -m\` to $bold\$HISTFILE$reset \n\n"
    return 1
  fi
}

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
bindkey "^U" backward-kill-line      # changes hex 0x15 to delete everything to the left of the cursor, rather than the whole line
bindkey "^X\\x7f" backward-kill-line # binds hex 0x18 0x7f with deleting everything to the left of the cursor
bindkey "^X^_" redo                  # adds redo

## Imports
. ~/code/dotfiles/_exports
. $DOTS/_powerlevel10k
. $DOTS/_colors
. $DOTS/_aliases
. $DOTS/_functions
. $DOTS/_untracked
. $DOTS/_oh-my-zsh
