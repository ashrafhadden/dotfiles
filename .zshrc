#!/usr/bin/env zsh
tput clear

## Fix iTerm keys (Mac)
# https://github.com/GabLeRoux/iterm2-macos-dynamic-profile/blob/master/fix_zsh_keys.sh
bindkey "^U" backward-kill-line # changes hex 0x15 to delete everything to the left of the cursor, rather than the whole line
bindkey "^X\\x7f" backward-kill-line # binds hex 0x18 0x7f with deleting everything to the left of the cursor
bindkey "^X^_" redo # adds redo

## ZSH Plugin Manager
. ~/code/dotfiles/.oh-my-zsh
# . ~/code/dotfiles/.zplugin