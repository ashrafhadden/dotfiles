#!/usr/bin/env zsh

source ~/code/oh-my-zsh/templates/zshrc.zsh-template
source /usr/local/Cellar/zsh-syntax-highlighting/0.6.0/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath=(/usr/local/share/zsh-completions $fpath)
source ~/.bash_profile
source ~/.iterm2_shell_integration.zsh # https://www.iterm2.com/documentation-shell-integration.html
