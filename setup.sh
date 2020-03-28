#!/usr/bin/env zsh

ls -lhaf ~ | grep ^l | awk '{print $9}'
hln $DOT/user.js ~/Library/Application\ Support/Firefox/Profiles/fdvn8zoa.default-1563575108220/user.js
ln -s 