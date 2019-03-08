#!/usr/bin/env zsh

## DESCRIPTION
# .bash_profile for oh-my-zsh users, functionality + portability ~= best of both worlds ^_^
# For when you want the interactiveness of ZSH but the portability of Bash
# Compatible with Bash <=3.2.57 and ZSH ^5.7.1
# Caters to Mac users with the following tools:
# oh-my-zsh, Homebrew, NPM, Rust, iTerm2, VSCode

## DIRECTORIES
alias cdc="cd ~/code"
alias cdp="cd ~/code/bt-vue"

## CONFIGS
alias css="code '$HOME/Library/Application Support/Code/User/vscode.css'"
alias gitconfig="code ~/code/dotfiles/.gitconfig"
alias gitignore="code ~/code/dotfiles/.gitignore"
alias hosts="code /private/etc/hosts"
alias p="code ~/code/dotfiles/.zprofile"
alias paths="code /etc/paths"
alias shells="code /etc/shells"
alias z="code ~/code/dotfiles/.zshrc"

## COMMANDS
alias assertions="pmset -g assertions | grep Prevent"
alias brewls='brew list --versions $(brew leaves)'
alias gpgls="gpg --list-secret-keys --keyid-format LONG"
alias npmls="npm list --global --depth=0"
alias out="npm outdated"
alias r="src" # https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/zsh_reload
alias s="source ~/code/dotfiles/bootstrap.sh > /dev/null; src"

## TPUT
# Easy, clean, portable terminal colors
# FOREGROUND
black=$(tput setaf 0)             # Black
blue=$(tput setaf 4)              # Blue / Purple
cyan=$(tput setaf 6)              # Cyan
green=$(tput setaf 2)             # Green
pink=$(tput setaf 5)              # Pink / Magenta
red=$(tput setaf 1)               # Red
white=$(tput setaf 7)             # White
yellow=$(tput setaf 3)            # Yellow

# BACKGROUND
blackb=$(tput setab 0)            # Black
blueb=$(tput setab 4)             # Blue / Purple
cyanb=$(tput setab 6)             # Cyan
greenb=$(tput setab 2)            # Creen
pinkb=$(tput setab 5)             # Pink / Magenta
redb=$(tput setab 1)              # Red
whiteb=$(tput setab 7)            # White
yellowb=$(tput setab 3)           # Yellow

# FORMATTING
bold=$(tput setaf 2 && tput bold) # Bold
half=$(tput dim)                  # Half-bright
reset=$(tput sgr0)                # Reset attributes
rev=$(tput rev)                   # Reverse text
standout=$(tput smso)             # Standout
standoutrm=$(tput rmso)           # Standout remove
underline=$(tput smul)            # Underline
underlinerm=$(tput rmul)          # Underline remove

## FUNCTIONS
# Find any application's bundle identifier (CFBundleIdentifier)
appid() {
  osascript -e 'id of app "'$1'"'
}

# Easily change & check dns servers on Mac
dns() {
  #LATER Add server names alongside addresses
  #LATER https://stackoverflow.com/questions/14370133/is-there-a-way-to-create-key-value-pairs-in-bash-script
  # https://servers.opennic.org/
  local dnsarr=(8.8.8.8 8.8.4.4 2001:4860:4860::8888 2001:4860:4860::8844 1.1.1.1 1.0.0.1 2606:4700:4700::1111 2606:4700:4700::1001 162.248.241.94 172.98.193.42)
  local dnsarrnames=(google google google google opennic opennic)
  case $1 in
  arr | a | ls | list | servers)
    printf '%s\n' "${dnsarr[@]}" # https://stackoverflow.com/questions/15691942/bash-print-array-elements-on-separate-lines
    ;;
  set)
    networksetup -setdnsservers "Wi-Fi" ${dnsarr[@]}
    networksetup -setdnsservers "Thunderbolt Ethernet" ${dnsarr[@]}
    ;;
  clr | clear | reset)
    networksetup -setdnsservers Wi-Fi "Empty"
    networksetup -setdnsservers "Thunderbolt Ethernet" "Empty"
    echo "DNS Servers cleared!"
    ;;
  *)
    paste <(networksetup -getdnsservers "Wi-Fi") <(printf '%s\n' "${dnsarrnames[@]}") | column -s $'\t' -t
    ;;
  esac
}

download() {
  case $1 in
  git)
    curl -LJO $2
    ;;
  *)
    curl $1
    ;;
  esac
}

# Combine Homebrew & NPM `doctor` command
dr() {
  echo "Running ${bold}brew doctor${reset}..." && brew doctor
  echo "Running ${bold}brew cask doctor${reset}..." && brew cask doctor
  echo "Running ${bold}npm doctor${reset}..." && npm doctor
  echo "Finished ${bold}dr${reset}!"
  notify "dr" "Finished dr!"
}

highlight() {
  local brewls0="'$1'"
  local brewls1=${brewls0// / ${bold}} # Replace space with space+bold
  echo ${brewls1//$'\n'/${reset}'\n'}  # Replace newline with reset+newline & print
}

# Easy computer naming on Mac
name() {
  case $1 in
  set | --set | -set | -s | s)
    sudo scutil --set ComputerName $2
    sudo scutil --set HostName $2
    sudo scutil --set LocalHostName $2
    sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $2
    ;;
  *)
    printf "ComputerName: $(scutil --get ComputerName)\n"
    printf "HostName: $(scutil --get HostName)\n"
    printf "LocalHostName: $(scutil --get LocalHostName)\n"
    printf "NetBIOSName: $(defaults read /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string)\n"
    ;;
  esac
}

# Easy custom Mac notifications from iTerm2 and VSCode
notify() {
  if [[ $TERM_PROGRAM == 'iTerm.app' ]]; then
    terminal-notifier -group "ITERM" -title $1 -message $2 -sender "com.googlecode.iterm2" -sound "default"
  else
    terminal-notifier -group "VISUAL STUDIO CODE" -title $1 -message $2 -sender "com.microsoft.VSCode" -sound "default"
  fi
}

# Get parent process
parent() {
  printf "$(ps -p $PPID)\n"
}

# Fully reinstall node_modules to fix NPM errors
reinstall() {
  posixPrompt "Are you sure you want to ${bold}reinstall${reset} ${yellow}/node_modules${reset} (${green}y${reset}/${red}n${reset})?"
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    printf "\nRunning ${bold}rm package-lock.json${reset}...\n" && rm package-lock.json
    printf "Running ${bold}rm -rf node_modules${reset}...\n" && rm -rf node_modules
    printf "Running ${bold}npm install${reset}...\n" && npm install
  else
    printf "\n${bold}reinstall${reset} aborted!\n"
  fi
}

# Check active shell on Mac
shell() {
  printf "Brew zsh location: ${bold}/usr/local/bin/zsh\n${reset}"
  dscl . -read /Users/$USER UserShell
  printf "1st line in ${bold}SHELLS${reset}:" && sed -n 5p /etc/shells
  printf "1st line in ${bold}PATHS${reset}:" && head -n 1 /etc/paths
}

# Verify that SSD Mac is not saving sleep images
sleepimage() {
  pmset -g | grep hibernatemode
  ls -lh /private/var/vm/sleepimage | grep B
}

# TODO Turn into git custom command https://coderwall.com/p/bt93ia/extend-git-with-custom-commands
syncfork() {
  printf "Running ${bold}git remote add upstream \$1${reset}...\n" && git remote add upstream $1
  printf "Running ${bold}git fetch upstream${reset}...\n" && git fetch upstream
  printf "Running ${bold}git checkout master${reset}...\n" && git checkout master
  printf "Running ${bold}git merge upstream/master${reset}...\n" && git merge upstream/master
}

# Find local apps not installed using Homebrew Cask that have a cask
# uncasked() {
# 	local EXCLUDE="firefox-developer-edition gpg-keychain visual-studio-code-insiders iterm"
# 	local INCLUDE=""

# 	while IFS= read -r App; do
# 		local ID=$(mdls -name kMDItemCFBundleIdentifier /Applications/$App | cut -d \" -f2)
# 		if [[ $ID != com.apple* && $ID != "kMDItemCFBundleIdentifier = (null)" && $ID != *${EXCLUDE}* ]]; then
# 			INCLUDE+="$App\n"
# 		fi
# 	done <<<$(ls /Applications)

# 	grep -Fxv -f <(brew cask ls) <(printf $INCLUDE | sed -e 's/.app//g' -e 's/-//g' -e 's/  / /g' -e 's/ /-/g' | tr '[:upper:]' '[:lower:]')
# }

# Combined oh-my-zsh, Homebrew, Rust, & NPM update
update() {
  echo "Updating ${bold}dracula.itermcolors${reset}..." && cd ~/code/misc/dracula_itermcolors && git pull
  echo "Updating ${bold}powerlevel9k.zsh-theme${reset}..." && cd ~/.oh-my-zsh/custom/themes/powerlevel9k && git pull && cd
  echo "Updating ${bold}oh-my-zsh${reset}..." && upgrade_oh_my_zsh | tail -n+2 | head -1
  echo "Updating ${bold}tldr${reset}..." &&
    printf "Running ${bold}brew upgrade${reset}...\n" && brew upgrade
  printf "Running ${bold}brew cask upgrade${reset}...\n" && brew cask upgrade
  printf "Running ${bold}brew cleanup${reset}...\n" && brew cleanup
  printf "Running ${bold}rustup update${rest}...\n" && rustup update
  printf "Running ${bold}npm update --global${reset}...\n" && npm update --global
  printf "Running ${bold}softwareupdate -i -a${reset}...\n" && softwareupdate -i -a
  # printf "Running ${bold}npm outdated${reset}...\n" && npm outdated
  printf "Finished ${bold}update${reset}!\n"
  notify "update" "Done!"
}

# Combined iTerm, Homebrew, oh-my-zsh, Rust and NPM versions
v() {
  case $1 in
  -v)
    printf "${bold}iTerm $(defaults read /Applications/iTerm.app/Contents/Info CFBundleVersion)\noh-my-zsh ${ZSH_VERSION}\nRustup $(rustup --version | awk '{print $2}')\nRust $(rustc --version | awk '{print $2}')\n"
    printf "\nMas $(brew info mas | xargs | head -c 17 | tail -c 5)${reset}\n"
    mas list
    printf "${bold}\n$(brew --version | xargs | head -c 14)${reset}\n"
    brew list --versions $(brew leaves)
    printf "\n${bold}Casks${reset}\n"
    brew cask list --versions
    printf "\n${bold}npm $(npm --version)${reset}\n"
    npm list --global --depth=0 | tail -n +2 | cut -c 5-
    ;;
  *)
    printf "${bold}iTerm $(defaults read /Applications/iTerm.app/Contents/Info CFBundleVersion)\noh-my-zsh ${ZSH_VERSION}\nRustup $(rustup --version | awk '{print $2}')\nRust $(rustc --version | awk '{print $2}')" | grep -E '\s([0-9].*)' && echo
    printf "${bold}\n$(brew --version | xargs | head -c 14)${reset}" | grep -E '\s([0-9].*)'
    brew list --versions $(brew leaves) | grep -E '\s([0-9].*)' && echo
    printf "\n${bold}npm $(npm --version)${reset}\n" | grep -E '\s([0-9].*)'
    npm list --global --depth=0 | tail -n +2 | cut -c 5- | grep -E '@.*'
    ;;
  esac
}

# Easy install of local VSCode extensions for testing
vsix() {
  printf "Running ${bold}vsce package && code --install-extension vscode-eslint@1.6.1${reset}...\n"
  vsce package && code --install-extension myextension.vsix
}

# ESLint-warning-free webpack output for Vue CLI
wo() {
  printf "/* eslint-disable */\nconst webpack_output = " >webpack_output.js
  vue inspect | sed "s/native code/'native code'/g" >>webpack_output.js
  code webpack_output.js
}

## POSIX
# Portable sh patches for when Bash implementation doesn't jive with active ZSH shell
posixPrompt() {
  # https://stackoverflow.com/questions/226703/how-do-i-prompt-for-yes-no-cancel-input-in-a-linux-shell-script
  echo -n "$1"
  old_stty_cfg=$(stty -g)
  stty raw -echo
  local REPLY=$(while ! head -c 1 | grep -i '[ny]'; do true; done)
  stty $old_stty_cfg
}

## EXAMPLES
# Highlight 2nd column of output
exampleParameterSubstitution() {
  local brewls0=$(brew list --versions $(brew leaves))
  local brewls1=${brewls0// / ${bold}}
  echo ${brewls1//$'\n'/${reset}'\n'}
}

## TEMPLATES
# Easy copy-paste templates for quick construction of new functions
templateCase() {
  # https://www.gnu.org/software/bash/manual/bash.html#Conditional-Constructs
  case $1 in
  verbose | --verbose | v | -v)
    printf "Argument matched ${bold}v${reset}!\n"
    ;;
  *)
    printf "${bold}${red}Invalid${reset} argument!"
    ;;
  esac
}

templatePrompt() {
  # https://stackoverflow.com/questions/1885525/how-do-i-prompt-a-user-for-confirmation-in-bash-script
  posixPrompt "Are you sure?"
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    printf "\nYou answered ${bold}yes${reset}\n"
  else
    printf "\nYou answered ${bold}no${reset}\n"
  fi
}

## CHEATSHEET
getQuotedString() {
  # https://unix.stackexchange.com/questions/137030/how-do-i-extract-the-content-of-quoted-strings-from-the-output-of-a-command
  cut -d \" -f2
}

## ENVIRONMENT-SPECIFIC
eval $(thefuck --alias)
