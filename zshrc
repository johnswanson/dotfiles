# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
unsetopt correct_all

# If not running interactively, do not do anything
[[ $- != *i* ]] && return
#[[ $TERM != screen* ]] && exec tmux

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="personal"

export EDITOR="vim"
export GOPATH=$HOME/langs/golang
export GUILE_LOAD_PATH=$home/langs/guile
export GOMAXPROCS=8
export BAT_CHARGE="/usr/local/bin/batcharge.py"
export NODE_PATH="/usr/local/lib/node_modules"
alias pw="mawud"
alias p="ssh johnswanson@dev.paste.bz"
alias pwp="python ~/Dropbox/pw-generator/pw.py"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh
bindkey -v
bindkey "^K" history-beginning-search-backward
bindkey "^J" history-beginning-search-forward

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin:/Library/Frameworks/Python.framework/Versions/2.7/bin:$GOPATH/bin:/usr/local/share/npm/bin:/Users/jds/Library/Haskell/bin:/Applications/Racket\ v5.3.1/bin:/usr/local/Cellar/chicken/4.7.0.6/bin
