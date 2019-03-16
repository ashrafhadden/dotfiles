#!/usr/bin/env bash

# Prevent running script, still a WIP
printf "Script is still a WIP, do not attempt to run, exiting in 10 seconds...\n"
sleep 10
exit 1

# Run this once to setup Homebrew, Mac setting defaults,
# and your oh-my-zsh environment

# You can run this multiple times safely with no side-effects

# Ensure colored command output for ${bold}, ${reset}, etc...
. ./_tput-colors

# Load zsh-bash compatible yes-no prompt
. ./_yes-no-prompt

_bashprompt() {
  read -p "Install Homebrew? Waiting for input: (${green}y${reset}/${red}n${reset})" choice
  if   [[ $choice =~ ^[Yy]$ ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  case "$choice" in
  y | Y) printf "You selected ${green}yes${reset}. Installing Homebrew...\n" &&
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" ;;
  n | N) printf "You selected ${red}no${reset}. Exiting script.\n" ;;
  *)  printf "${redb}${black}INVALID${reset} input! Exiting script.\n" ;;
  esac
}

which brew &>/dev/null ||
  printf "Homebrew not installed. It is required to run ${bold}brew.sh${reset}, ${bold}mas.sh${reset}, and ${bold}duti.sh${reset}\n" &&
  _bashprompt

. ./brew.sh
. ./mas.sh
. ./macos.sh
. ./duti

## SYMLINKS
# Symlinks FTW! \o/
# Symlink stands for symbolic link, A.K.A. an alias
# same as when you right-click a file > Make Alias in Finder

# Pros vs copying
# • Faster
# • Smaller, 50 bytes on avg
# • Less duplicates in file search
# • Single source of truth, prevent accidental forks
# • Write once, reference anywhere
# • Faster shell reload after dotfiles edits since we aren't having to cp or rsync to $HOME

## Symlink dotfiles

ln -s ~/code/dotfiles/.zlogin ~/.zlogin &&
  printf "${bold}~/code/dotfiles/.zlogin${reset} symlinked to ${bold}~/.zlogin${reset}\n"

ln -s ~/code/dotfiles/.zshrc ~/.zshrc &&
  printf "${bold}~/code/dotfiles/.zshrc${reset} symlinked to ${bold}~/.zshrc${reset}\n"

ln -s ~/code/dotfiles/.gitconfig ~/.gitconfig &&
  printf "${bold}~/code/dotfiles/.gitconfig${reset} symlinked to ${bold}~/.gitconfig${reset}\n"

ln -s ~/code/dotfiles/.gitignore ~/.gitignore &&
  printf "${bold}~/code/dotfiles/.gitignore${reset} symlinked to ${bold}~/.gitignore${reset}\n"

## Copy App Settings
# Most app settings cannot be symlinks since they need to be writable

rsync \
  ~/code/dotfiles/iterm2-macos-dynamic-profile/fix-iterm2-keys-profile.json \
  ~/Library/Application\ Support/iTerm2/DynamicProfiles &&
  printf "${bold}~/code/dotfiles/iterm2-macos-dynamic-profile/fix-iterm2-keys-profile.json${reset} sync'd to ${bold}~/Library/Application\ Support/iTerm2/DynamicProfiles${reset}\n"

printf "You must manually install ${bold}Dracula.itermcolors${reset}!"
printf "Packages without managers:\n\n${yellow}(These must be manually downloaded)${reset}\nOpenInCode ${cyan}https://github.com/sozercan/OpenInCode${reset}\n"
