#!/usr/bin/env zsh

local output=$(zplugin times | tail -n +2 | sed -e '$ d')
echo $output
local keys=($(echo $output | cut -d' ' -f4))
local values=($(echo $output | cut -d' ' -f1))
# paste <(printf "%s\n" "${keys[@]}") <(printf "%s\n" "${values[@]}") | xargs
# printf '%s\n' "${keys[@]}"
# printf '%s\n' "${values[@]}"
typeset -A array
array=($({paste <(printf "%s\n" "${keys[@]}") <(printf "%s\n" "${values[@]}")} | xargs))
# echo $array
