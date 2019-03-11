#!/usr/bin/env bash

## duti
# Ensure that all typeless and plain-text files are opened by VSCode
# https://apple.stackexchange.com/questions/13557/choose-a-default-app-for-opening-files-with-no-extension

which duti || brew install duti

duti -s com.microsoft.VSCode public.plain-text all
duti -s com.microsoft.VSCode public.source-code all
duti -s com.microsoft.VSCode public.unix-executable all
duti -s com.microsoft.VSCode sh
duti -s com.microsoft.VSCode txt
duti -x sh
duti -x txt