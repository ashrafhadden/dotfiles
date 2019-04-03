#!/usr/bin/env bash

## Prompt

PROMPT_COMMAND=prompter
prompter() {
  if [[ $PWD == '/Users/ashrafhadden' ]]; then
    local icon=
  else
    local icon=
  fi
  # yellow='\[\e[33m\]'
  # reset='\[\e[m\]'
  dpath0=${PWD/\/Users\/ashrafhadden/\~$yellow}
  # dpath1=${dpath0//Users/${yellow}Users$reset}
  export PS1="$icon $dpath0 $reset"
}

## Dotfiles
export dots='/Users/ashrafhadden/code/dotfiles'
. $dots/.exports
. $dots/.tput-colors
. $dots/.aliases
. $dots/.functions

## Misc
eval $(thefuck --alias) # https://github.com/nvbn/thefuck#manual-installation
. ~/.iterm2_shell_integration.bash # https://www.iterm2.com/documentation-shell-integration.html
