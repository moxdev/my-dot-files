# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="cobalt2"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#####################################################
# Check directory for nvm.sh file
# to load correct npm version
#####################################################

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
# This will auto load a .nvmrc, if not found will use the default version
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

#####################################################
# NVM Upgrade LTS
#####################################################

function nvm-upgrade {
  local prev_ver=$(nvm current)
  nvm install --lts --latest-npm
  if [ "$prev_ver" != "$(nvm current)" ]
  then
    nvm reinstall-packages $prev_ver
    nvm uninstall $prev_ver
  fi
  nvm cache clear
}

#####################################################
# Aliases
#####################################################

#####################################################
# Mac Commands
#####################################################

alias open="open ."
alias shutdown="sudo shutdown -h now"

#####################################################
# Directory Aliases (HOME MAC)
#####################################################

alias ..="cdl .."
alias apps="cdl /Applications"
alias storage="cdl /Volumes/Storage"
alias box="cdl ~/Box\ Sync"
alias pro="cdl ~/projects"
alias desktop="cdl ~/Desktop"
alias downloads="cdl ~/Downloads"
alias rv5="cdl ~/Documents/frontend-masters/React/1.\ Intro\ to\ React\ V5/dev/mycode"

#####################################################
# Edit Host File & Desktop Server preferences
#####################################################
alias host="subl /private/etc/hosts"
alias flush="dscacheutil -flushcache"

#####################################################
# ZSH Configs
#####################################################

alias sc="source ~/.zshrc"
alias zsh1="subl ~/.zshrc"
alias ohmy="open ~/.oh-my-zsh"

#####################################################
# Karabiner Config File
#####################################################
alias kara="subl ~/.config/karabiner/karabiner.json"


#####################################################
# Terminal Commands
#####################################################

# Remove a DIR with files
alias rmdir="rm -rf -i"

# Remove node_modules and re-install
alias dnode="rm -rf node_modules/ && npm install"

#####################################################
# Kill localhost:8000
#####################################################
alias=killlocal='kill -9 $(lsof -i TCP:8000 | grep LISTEN | awk "{print $2}")'

#####################################################
# Git
#####################################################

alias ignore="subl ~/.gitignore_global"
alias dstore="git rm --cached .DS_Store"
alias clone="git clone"
alias gadd="gaa && gcmsg"
alias glist="git branch -r"  # list all branches
alias gnode="git rm -r --cached node_modules"
alias cached="find . -name .DS_Store -print0 | xargs -0 git rm --ignore-unmatch -f" # This will remove all cached DS_Stores from repo
alias cleantest="git clean -df -n"
alias clean="git clean -df"
alias gst="git status -sb"
alias gbranch="git branch"
alias gcm="git checkout main"

# (no longer necessary with git 2.28) alias ginit='git init && git symbolic-ref HEAD refs/heads/main'

# Type `git open` to open the GitHub page or website for a repository.
# Step #1: npm install -g git-open
# Step #2: cd local_repo_directory
# Strep #3 git open
# More examples: https://github.com/paulirish/git-open
# Bonus use the following aliases
# @usage gio
alias gopen="git open"

# Git Commit, Add all and Push — in one step.
function gcap() {
  git add . && git commit -m "$*" && git push
}

# Delete Local Branch
function gitdeletelocal() {
  git branch -d "$@"
}

# Delete Remote Branch
function gitdeleteremote() {
  git push origin --delete "$@"
}


#####################################################
# Restart MySQL
#####################################################
alias rmysql="brew services restart mysql"

#####################################################
# Show hidden files aliases
#####################################################

alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'

alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

#####################################################
# Show or Hide Desktop
#####################################################

alias hidedesktop='defaults write com.apple.finder CreateDesktop false; killall Finder'

alias showdesktop='defaults write com.apple.finder CreateDesktop true; killall Finder'

#####################################################
# Show or Hide full path in top of finder window
#####################################################

alias showpath='defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES;killall Finder'
alias hidepath='defaults write com.apple.finder _FXShowPosixPathInTitle -bool NO;killall Finder'

######################################################
# Special functions
######################################################

# (Combines cd and ls to see files in directory cdl)
function cdl(){ cd "$1";ls -1; }

# (Change directory to the current Finder directory)
cdf() {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}

######################################################
# Grab GitHub URL fron Firefox and clone to projects dir
######################################################

# https://egghead.io/lessons/egghead-use-a-zsh-function-with-applescript-to-get-the-url-from-chrome


cloneu() {
	cd ~/projects

	url=$(
		osascript <<EOD
  			use scripting additions
			use framework "Foundation"

			tell application "Firefox" to activate

			set thePasteboard to current application's NSPasteboard's generalPasteboard()
			set theCount to thePasteboard's changeCount()

			-- send cmd+l and cmd+c keystrokes to FF to highlight and copy the URL
			tell application "System Events"
				keystroke "l" using {command down}
				delay 0.2
				keystroke "c" using {command down}
			end tell

			-- wait for the clipboard content change to have been detected
			repeat 20 times
				if thePasteboard's changeCount() is not theCount then exit repeat
				delay 0.1
			end repeat

			-- get the clipboard contents
			set the_url to the clipboard

			return the_url as text
EOD
	)

	repo=${url:19}
	name=${repo:t}

	git clone git@github.com:$repo && code $name && cd ~/projects/$name && open .
}

######################################################
# Make DIR and CD DIR
######################################################

mkcd () {
    mkdir -p -- "$1" &&
    cd -P -- "$1"
}

######################################################
# Touch $file and Open $file
######################################################

tfiles() {
	for item in "$@"; do
  		if [ "$item" ]; then
    		touch "$item" && open "$item"
  		else
    		echo "No Areguments Given"
  		fi
	done
}

######################################################
# Rename files in DIR (Doesnt work - refactor)
######################################################

rename() {
	for i in *; do
		mv "$i" "${i/ *./.}"
	done
}

#####################################################
# Added by termtile (https://github.com/apaszke/termtile)
#####################################################

alias ul='osascript ~/.termtile/tile.scpt up left'
alias ur='osascript ~/.termtile/tile.scpt up right'
alias dl='osascript ~/.termtile/tile.scpt down left'
alias dr='osascript ~/.termtile/tile.scpt down right'
alias ll='osascript ~/.termtile/tile.scpt left'
alias rr='osascript ~/.termtile/tile.scpt right'
alias up='osascript ~/.termtile/tile.scpt up'
alias down='osascript ~/.termtile/tile.scpt down'
alias big='osascript ~/.termtile/resize.scpt'
alias cen='osascript ~/.termtile/center.scpt'
alias max='osascript ~/.termtile/maximize.scpt'
alias sn='osascript ~/.termtile/changeScreen.scpt next'
alias fs='osascript ~/.termtile/fullscreen.scpt'

#####################################################
# Browsersync start
#####################################################

# (Basic HTML,CSS,JS)
alias basicbrowser="browser-sync start --server --files='css/*.css, js/*.js, sass/*.scss, *.html, *.css, *.js'"

# (Basic WordPress Site)
alias browser="browser-sync start --config bs-config.js"

#####################################################
# React Commands
#####################################################

alias webpack='node_modules/.bin/webpack-dev-server'
alias wpserver='./node_modules/.bin/webpack-dev-server'

#####################################################
# Gatsby Commands
#####################################################
alias gdev='gatsby develop'

#####################################################
# Sass watch
#####################################################
alias sass="sass --watch scss/styles.scss:./styles.css"

#####################################################
# Docker Commands
#####################################################
#drm() { docker rm $(docker ps -a -q); }
# Get container IP
#alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
#alias dstart="docker-compose up -d"
#alias dstop="docker-compose stop"
#alias dstopall="docker stop $(docker ps -a -q)"
#alias dshowall="docker ps -a --format 'table {{.Names}}\t{{.ID}}\t{{.Status}}\t{{.RunningFor}}\t{{.Ports}}\t{{.Networks}}'"
#alias dshow="docker ps --format 'table {{.Names}}\t{{.ID}}\t{{.Status}}\t{{.RunningFor}}\t{{.Ports}}\t{{.Networks}}'"
#alias drm="docker rm"