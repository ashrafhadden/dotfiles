#!/usr/bin/env zsh

# .zshrc for oh-my-zsh & dotfiles users
# Compatible with ZSH ^5.7.1

# Caters to Mac users with the following tools:
# dotfiles, oh-my-zsh, Homebrew, NPM, Rust, iTerm2, VSCode

## OH-MY-ZSH
# Initialize & configure oh-my-zsh

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel9k/powerlevel9k"

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

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

#WARNING No commas between plugins!
plugins=(
  zsh_reload
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh

## SETUP ENVIRONMENT

# dotfiles
source ~/code/dotfiles/_aliases
source ~/code/dotfiles/_exports
source ~/code/dotfiles/_tput-colors
source ~/code/dotfiles/_functions
# oh-my-zsh plugins
source /usr/local/Cellar/zsh-syntax-highlighting/0.6.0/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval $(thefuck --alias) # https://github.com/nvbn/thefuck#manual-installation
source ~/.iterm2_shell_integration.zsh # https://www.iterm2.com/documentation-shell-integration.html
