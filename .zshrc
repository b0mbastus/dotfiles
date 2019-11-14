# If you come from bash you might have to change your $PATH.
export TERM="st-256color"
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Flutter
export PATH=/home/jan/lib/flutter/bin:$PATH

if [[ -d ${HOME}/anaconda3/bin ]]; then
	alias anaconda_navigator="$HOME/anaconda3/bin/anaconda-navigator > /dev/null 2>&1 &"
	export PATH_SAVE=$PATH
	alias enable_anaconda="export PATH=$HOME/anaconda3/bin:$PATH"
	alias disable_anaconda="export PATH=$PATH_SAVE"
fi

# Path to your oh-my-zsh installation.
export ZSH=/home/jan/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="agnoster"
ZSH_THEME="powerlevel9k/powerlevel9k"

# Powerlevel9k settings
POWERLEVEL9K_MODE="nerdfont-complete"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs) 
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)


# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  archlinux
  python
#  vi-mode
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias switchkeys="(setxkbmap -query | grep -q 'layout:\s\+us') && setxkbmap de || setxkbmap us"

alias testchars="echo '\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699'"
alias zshconfig="vim ~/.zshrc"
alias xmerge="xrdb -merge ~/.Xresources"
alias ohmyzsh="vim ~/.oh-my-zsh"

alias activate="source ./bin/activate"

alias lock="~/scripts/lock.sh"

alias xclip="xclip -selection c"

alias enable_loopback="pacmd load-module module-loopback latency_msec=5"
alias disable_loopback="pacmd unload-module module-loopback"

d="dirs -v | head -10"
1="cd -"
2="cd -2"
3="cd -3"
4="cd -4"
5="cd -5"
6="cd -6"
7="cd -7"
8="cd -8"
9="cd -9"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

if [ -f ${HOME}/system.sh ]; then
	source ${HOME}/system.sh
fi

if [[ "$SYSTEM" == "Laptop" ]]; then
	# Alter brightness
	# Set max brightness
	alias brightness_max="sudo tee /sys/class/backlight/intel_backlight/brightness <<< `cat /sys/class/backlight/intel_backlight/max_brightness`"
	# Set medium brightness
	alias brightness_medium="sudo tee /sys/class/backlight/intel_backlight/brightness <<< 2000"
	# Set low brightness
	alias brightness_low="sudo tee /sys/class/backlight/intel_backlight/brightness <<< 1000"
fi
