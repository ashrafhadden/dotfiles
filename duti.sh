#!/usr/bin/env bash

## duti
# Ensure that all typeless and plain-text files are opened by VSCode
# https://apple.stackexchange.com/questions/13557/choose-a-default-app-for-opening-files-with-no-extension

which duti > /dev/null || brew install duti

sudo duti -s com.microsoft.VSCode public.plain-text all
sudo duti -s com.microsoft.VSCode public.source-code all
sudo duti -s com.microsoft.VSCode public.unix-executable all
sudo duti -s com.microsoft.VSCode sh
sudo duti -s com.microsoft.VSCode txt
sudo duti -s com.microsoft.VSCode toml

sudo duti -x sh
sudo duti -x txt
sudo duti -x toml
