#!/usr/bin/env bash

## DESCRIPTION
# .bash_profile for oh-my-zsh users, functionality + portability ~= best of both worlds ^_^
# For when you want the interactiveness of ZSH but the portability of Bash
# Compatible with Bash ^5.0.2 and ZSH ^5.7.1
# Caters to Mac users with the following tools:
# oh-my-zsh, Homebrew, NPM, Rust, iTerm2, VSCode

## DIRECTORIES
alias cdc="cd ~/code"
alias cdp="cd ~/code/bt-vue"

## CONFIGS
alias css="code -r '$HOME/Library/Application Support/Code/User/vscode.css'"
alias gitconfig="code -r ~/.gitconfig"
alias hosts="code -r /private/etc/hosts"
alias npmconfig="npm config edit -g"
alias omz="code -r '~/code/oh-my-zsh/templates/zshrc.zsh-template'"
alias p="code -r ~/.bash_profile"
alias paths="code -r /etc/paths"
alias shells="code -r /etc/shells"
alias z="code -r ~/.zshrc"

## COMMANDS
alias assertions="pmset -g assertions | grep Prevent"
alias dated="npm outdated"
alias gpglist="gpg --list-secret-keys --keyid-format LONG"
alias no="npm outdated"
alias npmls="npm ls -g --depth=0"
alias out="npm outdated"
alias s="tput cl && source ~/.bash_profile"

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
	local dnsarr=(1.1.1.1 1.0.0.1 2606:4700:4700::1111 2606:4700:4700::1001 162.248.241.94 172.98.193.42)
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
		echo "Wi-Fi"
		printHZ
		networksetup -getdnsservers "Wi-Fi" && echo
		echo "Thunderbolt Ethernet"
		printHZ
		networksetup -getdnsservers "Thunderbolt Ethernet" && echo
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
	case $1 in
	-v | --verbose | -l | --long)
		printf "Running ${bold}brew doctor${reset}...\n" && brew doctor
		printf "Running ${bold}brew cask doctor${reset}...\n" && brew cask doctor
		printf "Running ${bold}npm doctor${reset}...\n" && npm doctor
		printf "Finished ${bold}dr${reset}!\n"
		notify "dr" "Finished dr!"
		;;
	*)
		printf "Running ${bold}brew doctor${reset}...\n" && brew doctor
		printf "Running ${bold}brew cask doctor${reset}...\n" && brew cask doctor
		printf "Finished ${bold}dr${reset}!\n"
		notify "dr" "Finished dr!"
		;;
	esac
}

# Reminder on how to replace branches
gitreplace() {
	printf "${bold}Step 1${reset}\n"
	printf "Checkout branch to be replaced.\n"
	printf "${bold}Step 2${reset}\n"
	printf "git reset --hard TARGET_BRANCH\n"
}

# Pipeable terminal-notifier alias
notifyTee() {
	tee >(notifyCustom $1 $2)
}

# Easy custom Mac notifications from iTerm2 and VSCode
notifyCustom() {
	if [[ $TERM_PROGRAM == 'iTerm.app' ]]; then
		terminal-notifier -group "ITERM" -title $1 -message $2 -sender "com.googlecode.iterm2" -sound "default"
	else
		terminal-notifier -group "VISUAL STUDIO CODE" -title $1 -message $2 -sender "com.microsoft.VSCode" -sound "default"
	fi
}

# Combine Hombrew & NPM outdated
outdated() {
	printf "Running ${bold}brew outdated${reset}...\n" && brew outdated
	printf "Running ${bold}brew cask outdated${reset}...\n" && brew cask outdated
	printf "Running ${bold}npm outdated --global${reset}...\n" && npm outdated --global
	printf "Running ${bold}npm outdated${reset}...\n" && npm outdated
	printf "Finished ${bold}outdated${reset}!\n"
	notifyCustom "Done!" "outdated"
}

# Get parent process
parent() {
	printf "$(ps -p $PPID)\n"
}

# Dymically print a horizontal line
printHZ() {
	# http://wiki.bash-hackers.org/snipplets/print_horizontal_line
	printf "${bold}"
	printf '%*s' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
	printf "${reset}"
}

# Reminder on fixing ports
portfix() {
	printf "${bold}lsof -i :port#${reset}\n"
	printf "${bold}kill -9 PID#${reset}\n"
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

# Easy switching between Hombrew node versions
nodeswitch() {
	case $1 in
	11)
		# brew unlink node
		# brew unlink node@10
		brew link node --overwrite
		printf "${bold}Current:${reset}\n"
		which node
		node -v
		;;
	10)
		# brew unlink node
		# brew unlink node@10
		brew link node@10 --overwrite
		printf "${bold}Current:${reset}\n"
		which node
		node -v
		;;
	esac
}

# Combined oh-my-zsh, Homebrew, Rust, & NPM update
update() {
	printf "Updating ${bold}dracula.itermcolors${reset}... " && cd ~/code/misc/dracula_itermcolors && git pull
	printf "Updating ${bold}powerlevel9k.zsh-theme${reset}... " && cd ~/.oh-my-zsh/custom/themes/powerlevel9k && git pull && cd
	printf "Updating ${bold}oh-my-zsh${reset}...\n" && upgrade_oh_my_zsh | tail -n+2 | head -1
	printf "Running ${bold}brew upgrade${reset}...\n" && brew upgrade
	printf "Running ${bold}brew cask upgrade${reset}...\n" && brew cask upgrade
	printf "Running ${bold}brew cleanup${reset}...\n" && brew cleanup
	printf "Running ${bold}rustup update${rest}...\n" && rustup update
	printf "Running ${bold}npm update --global${reset}...\n" && npm update --global
	printf "Running ${bold}softwareupdate -i -a${reset}...\n" && softwareupdate -i -a
	# printf "Running ${bold}npm outdated${reset}...\n" && npm outdated
	printf "Finished ${bold}update${reset}!\n"
	notifyCustom "update" "Done!"
}

# Find local apps not installed using Homebrew Cask that have a cask
uncasked() {
	local EXCLUDE="firefox-developer-edition gpg-keychain visual-studio-code-insiders iterm"
	local INCLUDE=""

	while IFS= read -r App; do
		local ID=$(mdls -name kMDItemCFBundleIdentifier /Applications/$App | cut -d \" -f2)
		if [[ $ID != com.apple* && $ID != "kMDItemCFBundleIdentifier = (null)" && $ID != *${EXCLUDE}* ]]; then
			INCLUDE+="$App\n"
		fi
	done <<<$(ls /Applications)

	grep -Fxv -f <(brew cask ls) <(printf $INCLUDE | sed -e 's/.app//g' -e 's/-//g' -e 's/  / /g' -e 's/ /-/g' | tr '[:upper:]' '[:lower:]')
}

# Combined iTerm, Homebrew, oh-my-zsh, Rust and NPM versions
v() {
	case $1 in
	-v)
		printf "${bold}iTerm $(defaults read /Applications/iTerm.app/Contents/Info CFBundleVersion)\noh-my-zsh ${ZSH_VERSION}\nRustup $(rustup --version | awk '{print $2}')\nRust $(rustc --version | awk '{print $2}')\n" | column -t
		printf "\nMas $(brew info mas | xargs | head -c 17 | tail -c 5)${reset}\n"
		mas list | column -t
		printf "${bold}\n$(brew --version | xargs | head -c 14)${reset}\n"
		brew list --versions $(brew leaves) | column -t
		printf "\n${bold}Casks${reset}\n"
		brew cask list --versions | column -t
		printf "\n${bold}npm $(npm --version)${reset}\n"
		npm list --global --depth=0 | tail -n +2 | cut -c 5- | column -t -s @
		;;
	*)
		printf "${bold}iTerm $(defaults read /Applications/iTerm.app/Contents/Info CFBundleVersion)\noh-my-zsh ${ZSH_VERSION}\nRustup $(rustup --version | awk '{print $2}')\nRust $(rustc --version | awk '{print $2}')\n"
		printf "${bold}\n$(brew --version | xargs | head -c 14)${reset}\n"
		brew list --versions $(brew leaves)
		printf "\n${bold}npm $(npm --version)${reset}\n"
		npm list --global --depth=0 | tail -n +2 | cut -c 5-
		;;
	esac
}

# Switch between code and code-insiders alias in .bash_profile functions
# vsca() {
# 	case $1 in
# 	-code | code | -c | c)
# 		unset -f code
# 		printf "VSCode alias set to \"code\"\n"
# 		;;
# 	-insiders | insiders | -i | i)
# 		code() {
# 			code-insiders $1 $2
# 		}
# 		printf "VSCode alias set to \"code-insiders\"\n"
# 		;;
# 	*)
# 		printf "${bold}${red}Invalid${reset} argument!"
# 		;;
# 	esac
# }

# Easy install of local VSCode extensions for testing
vsix() {
	printf "Running ${bold}vsce package && code --install-extension vscode-eslint@1.6.1${reset}...\n"
	vsce package && code --install-extension myextension.vsix
}

# ESLint-warning-free webpack output for Vue CLI
wo() {
	printf "/* eslint-disable */\nconst webpack_output = " >webpack_output.js
	vue inspect | sed "s/native code/'native code'/g" >>webpack_output.js
	code -r webpack_output.js
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
# export GPG_TTY=$(tty)
# export PATH="$HOME/.cargo/bin:$PATH"
eval $(thefuck --alias)
source ~/.iterm2_shell_integration.zsh # https://www.iterm2.com/documentation-shell-integration.html
