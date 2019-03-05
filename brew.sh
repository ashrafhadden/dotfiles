#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
# brew install coreutils
# ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
# brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
# brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
# brew install gnu-sed --with-default-names
# Install Bash 4.
# brew install bash
# brew install bash-completion2

# Install Homebrew zsh
brew install zsh

# Install oh-my-zsh
echo -n "Are you sure?"
old_stty_cfg=$(stty -g)
stty raw -echo
local REPLY=$(while ! head -c 1 | grep -i '[ny]'; do true; done)
stty $old_stty_cfg
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo "Aborting oh-my-zsh installation..."
fi

# Switch to using brew-installed zsh as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/zsh" /etc/shells; then
  echo "${BREW_PREFIX}/bin/zsh" | sudo tee -a /etc/shells
  chsh -s "${BREW_PREFIX}/bin/zsh"
fi

# Install GnuPG to enable PGP-signing commits.
# brew install gnupg

# Install more recent versions of some macOS tools.
# brew install grep

# Install other useful binaries.
brew install git
# brew install pigz
# brew install pv

# Remove outdated versions from the cellar.
brew cleanup

# Install favorite Homebrew formulas and casks
FORUMLAS=(
  node
  shfmt
  terminal-notifier
  thefuck
  tldr
  zsh
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)
CASKS=(
  android-file-transfer
  beaker-browser
  brave-browser-dev
  caprine
  daisydisk
  discord
  firefox
  firefox-developer-edition
  flux
  font-ubuntu-nerd-font-mono
  gifcapture
  google-chrome
  gpg-suite
  iterm2-nightly
  mactracker
  moom
  smoothscroll
  spectacle
  torguard
  visual-studio-code
  visual-studio-code-insiders
  vlc
  whatsapp
)
brew install ${FORUMLAS[@]}
brew install ${CASKS[@]}
