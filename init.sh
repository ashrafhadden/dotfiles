#!/usr/bin/env zsh

source brew.sh
source macos.sh

## SYMLINKS

# Symlink dotfiles

ln -s \
  ~/code/dotfiles/.zlogin \
  ~/.zlogin
printf "${bold}~/code/dotfiles/.zlogin${reset} symlinked to ${bold}~/.zlogin${reset}\n"

ln -s \
  ~/code/dotfiles/.zshrc \
  ~/.zshrc
printf "${bold}~/code/dotfiles/.zshrc${reset} symlinked to ${bold}~/.zshrc${reset}\n"

ln -s \
  ~/code/dotfiles/.gitconfig \
  ~/.gitconfig
printf "${bold}~/code/dotfiles/.gitconfig${reset} symlinked to ${bold}~/.gitconfig${reset}\n"

ln -s \
  ~/code/dotfiles/.gitignore \
  ~/.gitignore
printf "${bold}~/code/dotfiles/.gitignore${reset} symlinked to ${bold}~/.gitignore${reset}\n"

# Symlink App Settings

ln -s \
  ~/.iterm2/iterm2-macos-dynamic-profile/fix-iterm2-keys-profile.json \
  ~/Library/Application\ Support/iTerm2/DynamicProfiles

ln -s \
  ~/.iterm2/dracula_itermcolors/Dracula.itermcolors \
  ~/Library/Application\ Support/iTerm2/DynamicProfiles
