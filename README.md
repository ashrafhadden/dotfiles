# Ash's Dotfiles

Ash's dotfiles for Mojave Dark Mode fanatics and devs who like pretty things :)

## Install

> Reccomended to glance over [`bootstrap.sh`](https://github.com/ashrafhadden/dotfiles/blob/master/.zshrc) (it's very short), before running this command.

This command will run all one-time setup scripts (files ending in `.sh`).
You will be given yes/no prompts before each installation. In order for the
symlinks to work correctly `bootstrap.sh` will remove any similarly named
dotfiles in your home folder, however they will copied to `/backup` for you
just in case.

```bash
git clone https://github.com/ashrafhadden/dotfiles.git && cd dotfiles && . ./boostrap.sh
```

## Usage

Any of the `.sh` files can be run individually with `. ./file.sh`. They can be run multiple
times or at a later date if you wish to return to previous settings.

`. ./bootstrap.sh`

## Support

Caters to users with the following setup:

- [macOS Mojave](https://www.apple.com/macos/mojave/)
- [iTerm](https://iterm2.com/)
- [oh-my-zsh](https://ohmyz.sh/)
- [Powerlevel9k](https://github.com/bhilburn/powerlevel9k)
- [dracula-theme](https://draculatheme.com/)

Includes [aliases](https://github.com/ashrafhadden/dotfiles/blob/master/_aliases)
and [functions](https://github.com/ashrafhadden/dotfiles/blob/master/_functions)
for the following tools:

- [Homebrew](https://brew.sh/)
- [VSCode](https://code.visualstudio.com/)
- [NPM](https://www.npmjs.com/)

## About

Many a lovely hour were spent painstakingly hacking these little beauties.
I say "painstakingly" because I have a love-hate relationship with shell scripting.
I adore its immediate accessibility and universality. To be able to copy and paste
commands from the internet to my mac terminal and have them just work without any
other steps or setup is just magical. However the lack of portability across different
systems and the seemingly afterthought nature of its syntax disturb my inner
perfectionist. The POSIX standards introduced in '98 by Richard Stallman were a
wonderful start in the direction of true universality, however with the influx of
various new shells such as Bash, Zsh, and Fish, and the greed and lack of unity among
software giants controlling the space, syntax evolution and portability were again
diverted. Checkout this blog post to hear more of my ranting on universal languages.

### Design

Taking inspiration from Mathias' and Zach's dotfiles as well as Zach's
[dotfiles-are-meant-to-be-forked](https://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/)
blog post, I decided to use a little of both repos and sprinkle in my own style. I like
the clean nature of Holman's symlinks over the more agressive `rsync` method
used by Mathias to keep your dotfiles synced. Symlinks prevent possible confusion in editing dotfiles when
say opening the dotfile directly in your `~`home folder as opposed to your `/dotfiles` folder
and saving changes in `~`home, forgetting that your changes will be overwritten when you sync /
bootstrap your dotfiles again. Symlinks are also faster than copying, save disk space (50 bytes on avg),
prevent duplicates in file search, and encourage the healthy coding practice of editing only one source file
([a single source of truth](https://en.wikipedia.org/wiki/Single_source_of_truth))
and then only _referencing_ it everywhere else, as has been done for decades in many large codebases such as Homebrew.

#### Naming Convention

`_file`
Underscores signify that the file will be sourced at the end of [`.zshrc`](https://github.com/ashrafhadden/dotfiles/blob/master/.zshrc). The underscore is taking after
[SASS's partials](https://sass-lang.com/guide), where underscores siginify that a
file will be `include`d or `import`ed by other files. I feel it's a very intuitive
naming convention that more languages should be using. At a glance you know that a
file will be concatenated which makes reading and writing it more understandable.

`.file`
Dotfiles obviously signify that the file will be sourced on its own according to the
program or tool that its written for.

`file.sh`
Shell files signify that the file will be not be sourced by `.zshrc` but rather run
only once, either by themselves or one-by-one as called by `bootstrap.sh`.

## Credit

Kudos to...

- Mathias Bynens and his [dotfiles](https://github.com/mathiasbynens/dotfiles) repo
- Zach Holman and his [dotfiles](https://github.com/holman/dotfiles) repo
