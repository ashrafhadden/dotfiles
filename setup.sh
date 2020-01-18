#!/usr/bin/env zsh

ls -lhaf ~ | grep ^l | awk '{print $9}'
hln $DOT/user.js $FFPROFILE/user.js