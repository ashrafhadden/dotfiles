#!/usr/bin/env zsh

tput cl

ZSH_THEME=powerlevel10k/powerlevel10k
COMPLETION_WAITING_DOTS='true'

## Imports
. ~/code/dotfiles/_exports
. $DOT/_powerlevel10k
. $DOT/_aliases
. $DOT/_untracked
. $DOT/_colors
. $DOT/_functions

plugins=(
  # bgnotify
  # cargo
  # rust
  you-should-use
  colored-man-pages
  fast-syntax-highlighting
  zsh-autosuggestions
)
. $ZSH/oh-my-zsh.sh

## Fix iTerm keys (Mac)
# https://github.com/GabLeRoux/iterm2-macos-dynamic-profile/blob/master/fix_zsh_keys.sh
bindkey "^U" backward-kill-line      # changes hex 0x15 to delete everything to the left of the cursor, rather than the whole line
bindkey "^X\\x7f" backward-kill-line # binds hex 0x18 0x7f with deleting everything to the left of the cursor
bindkey "^X^_" redo                  # adds redo

function zshaddhistory() {
  if ! [[ $1 =~ ^(git commit -m) ]]; then
    print -sr -- ${1%%$'\n'}
    fc -p
  else
    printf "⚠️  Did not add \`git commit -m\` to $bold\$HISTFILE$reset \n\n"
    return 1
  fi
}

## Auto Dark/Light iTerm Profiles
if [[ $TERM_PROGRAM == 'iTerm.app' ]]; then
  local systemAppearance=$(defaults read -g AppleInterfaceStyle 2> /dev/null)
  case $systemAppearance in
  Dark)
    printf "\033]50;SetProfile=Dracula\a"
    ;;
  *)
    printf "\033]50;SetProfile=Tango Light\a"
    ;;
  esac
fi

if [[ $(sw_vers -productVersion) != 10.15.2 ]]; then
  printf "macOS has been updated!  Would you like to re-run $pink~/code/dotfiles/macos.sh$reset? [${green}y$reset/${red}N$reset]: "
  if read -q; then
    printf "\nRunning${bold}bootstrap.sh${reset}...\n"
    . ~/code/dotfiles/macos.sh
  else
    echo " $redb$black Aborting $reset $bold$funcstack[1]$reset..."
  fi
fi

. ~/.iterm2_shell_integration.zsh # https://www.iterm2.com/documentation-shell-integration.html
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" # https://www.iterm2.com/documentation-shell-integration.html
