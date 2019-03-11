#!/usr/bin/env bash

# Run this once to setup Homebrew, Mac setting defaults,
# and your oh-my-zsh environment

# Run again safely with no side-effects if you accidentally change anything
# or just want to be sure all your settings and environment is at it should be

# Ensure colored command output for ${bold}, ${reset}, etc...
source _tput-colors

_bashprompt() {
  read -p "Install Homebrew? Waiting for input: (${green}y${reset}/${red}n${reset})" choice
  case "$choice" in
  y | Y) printf "You selected ${green}yes${reset}. Installing Homebrew...\n" &&
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" ;;
  n | N) printf "You selected ${red}no${reset}. Exiting script.\n" ;;
  *)  printf "${redb}${black}INVALID${reset} input! Exiting script.\n" ;;
  esac
}

which brew &>/dev/null ||
  printf "Homebrew not installed. It is required to run \
${bold}brew.sh${reset}, ${bold}mas.sh${reset}, and ${bold}duti.sh${reset}\n" &&
  _bashprompt

source brew.sh
source mas.sh
source macos.sh
source duti

## SYMLINKS
# Symlinks FTW!!!
# Pros
# • Save space
# • Faster than copying
# • No duplicates in file search
# • Write once, reference aynwhere
# • Faster shell reload after dotfiles edits since we aren't rsync'ing or cp'ing

## Symlink dotfiles

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

## Symlink App Settings

ln -s \
  ~/code/dotfiles/iterm2-macos-dynamic-profile/fix-iterm2-keys-profile.json \
  ~/Library/Application\ Support/iTerm2/DynamicProfiles

ln -s \
  ~/code/dotfiles/dracula_itermcolors/Dracula.itermcolors \
  ~/Library/Application\ Support/iTerm2/DynamicProfiles

printf "Don't forget to download OpenInCode! \n${cyan}https://github.com/sozercan/OpenInCode${reset}\n"
