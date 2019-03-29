#!/usr/bin/env zsh

# LOADING='loading' # ice mod wait variable

## OH-MY-ZSH
export ZSH="$HOME/.oh-my-zsh" # Path to your oh-my-zsh installation.

ZSH_THEME='powerlevel9k/powerlevel9k'

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='black'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='black'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_BACKGROUND='black'
POWERLEVEL9K_DIR_HOME_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='black'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='white'
POWERLEVEL9K_DIR_PATH_HIGHLIGHT_BOLD='true'
POWERLEVEL9K_DIR_PATH_HIGHLIGHT_FOREGROUND='yellow'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir)
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$''
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time)
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='black'
POWERLEVEL9K_STATUS_OK_BACKGROUND='black'

# ENABLE_CORRECTION="true" # Uncomment the following line to enable command auto-correction.
COMPLETION_WAITING_DOTS='true' # Uncomment the following line to display red dots whilst waiting for completion.

plugins=(
  zsh_reload
  bgnotify
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh

export DOTS='/Users/ashrafhadden/code/dotfiles'
source $DOTS/_exports
source $DOTS/_tput-colors
source $DOTS/_aliases
source $DOTS/_functions

## Zplugin
# source ~/.zplugin/bin/zplugin.zsh

# # zplugin theme
# # zpl delete OMZ::lib/git.zsh OMZ::plugins/git/git.plugin.zsh bhilburn/powerlevel9k
# zplugin snippet OMZ::lib/git.zsh
# zplugin snippet OMZ::plugins/git/git.plugin.zsh
# zplugin cdclear -q # <- forget completions provided up to this moment
# setopt promptsubst
# zplugin light bhilburn/powerlevel9k

# zplugin snippet "$ZSH/oh-my-szsh.sh" # 0.427
# zplugin snippet 'OMZ::plugins/zsh_reload/zsh_reload.plugin.zsh' # 0.001
# export DOTS='/Users/ashrafhadden/code/dotfiles'
# zplugin snippet "$DOTS/_exports" # 0.003
# zplugin snippet "$DOTS/_aliases" # 0.008
# zplugin snippet "$DOTS/_functions" # 0.014
# zplugin snippet "$DOTS/_tput-colors" # 0.076
# zplugin snippet 'OMZ::plugins/bgnotify/bgnotify.plugin.zsh' # 0.010
# zplugin load 'zsh-users/zsh-autosuggestions' # 0.040
# zplugin snippet 'OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh' # 0.002
# # Lazy load
# zplg ice svn wait'[[ $LOADING=='done' ]]' atload'OMZ::plugins/command-not-found/command-not-found.plugin.zsh' # 1.208
# zplugin snippet 'OMZ::plugins/command-not-found/command-not-found.plugin.zsh'
# # Must be loaded last
# zplugin ice wait'[[ $LOADING=='done' ]]' 'zdharma/fast-syntax-highlighting' atinit'zpcompinit' # 0.185
# zplugin load 'zdharma/fast-syntax-highlighting'

# autoload -Uz compinit
# compinit
# zplugin cdreplay -q

## Misc
source ~/.iterm2_shell_integration.zsh # https://www.iterm2.com/documentation-shell-integration.html
eval $(thefuck --alias) # https://github.com/nvbn/thefuck#manual-installation

# LOADING='done' # ice mod wait condition; tell ice mods they can load now
