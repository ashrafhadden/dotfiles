#!/usr/bin/env zsh

# LOADING='loading' # ice mod wait variable

## OH-MY-ZSH
export ZSH="$HOME/.oh-my-zsh" # Path to your oh-my-zsh installation.

ZSH_THEME='powerlevel9k/powerlevel9k'

POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='transparent'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='transparent'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_BACKGROUND='transparent'
POWERLEVEL9K_DIR_HOME_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='transparent'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='white'
POWERLEVEL9K_DIR_PATH_HIGHLIGHT_BOLD='true'
POWERLEVEL9K_DIR_PATH_HIGHLIGHT_FOREGROUND='yellow'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir)
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$''
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time)
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$''

# ENABLE_CORRECTION="true" # Uncomment the following line to enable command auto-correction.
COMPLETION_WAITING_DOTS='true' # Uncomment the following line to display red dots whilst waiting for completion.

plugins=(
  # zsh_reload
  bgnotify
  colored-man-pages
  fast-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export DOTS='/Users/ashrafhadden/code/dotfiles'
source $DOTS/_exports
source $DOTS/_tput-colors
source $DOTS/_aliases
source $DOTS/_functions

## Zplugin
# source $DOTS/_zplugin

## Misc
source ~/.iterm2_shell_integration.zsh # https://www.iterm2.com/documentation-shell-integration.html
eval $(thefuck --alias) # https://github.com/nvbn/thefuck#manual-installation

# LOADING='done' # ice mod wait condition; tell ice mods they can load now
