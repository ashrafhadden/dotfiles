#!/usr/bin/env zsh

cd ~/code/dotfiles

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~
	# Load the shell dotfiles, and then some:
	# * ~/.path can be used to extend `$PATH`.
	# * ~/.extra can be used for other settings you don’t want to commit.
	# https://github.com/mathiasbynens/dotfiles/blob/master/.bash_profile
	for file in ~/.{path,exports,aliases,functions,extra}; do
		[ -r "$file" ] && [ -f "$file" ] && source "$file"
	done
	unset file
}

doIt
unset doIt
