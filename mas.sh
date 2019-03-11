#!/usr/bin/env bash

## MAS
# Install mac app store apps

apps=(
  497799835 # Xcode
  1351639930 # Gifski
)

mas install ${apps[@]}

unset apps
