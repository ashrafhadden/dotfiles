#!/usr/bin/env bash

## Homebrew

formulas=(
  bfg
  duti
  ffmpeg
  git
  mas
  node
  ruby
  shfmt
  terminal-notifier
  thefuck
  tldr
  youtube-dl
  zsh
  zsh-autosuggestions
  zsh-syntax-highlighting
)

casks=(
  android-file-transfer
  beaker-browser
  brave-browser-dev
  caprine
  daisydisk
  dash
  discord
  firefox
  firefox-developer-edition
  flux
  font-ubuntu-nerd-font-mono
  google-chrome
  gpg-suite
  hyper
  iterm2-nightly
  mactracker
  moom
  qladdict
  qlcolorcode
  qlimagesize
  qlmarkdown
  qlstephen
  qlswift
  qlvideo
  quicklook-json
  quicklookase
  smoothscroll
  suspicious-package
  torguard
  transmission
  upterm
  visual-studio-code
  visual-studio-code-insiders
  vlc
  webpquicklook
  webtorrent
  whatsapp
)

brew install ${formulas[@]}
brew cask install ${casks[@]}

unset formulas
unset casks
