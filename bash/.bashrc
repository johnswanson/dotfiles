#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

function _update_ps1() {
    PS1="$(~/.powerline-shell.py --cwd-mode plain $? 2> /dev/null)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

HISTSIZE=-1
HISTFILESIZE=-1

alias ls="ls --color"

export NPM_PACKAGES="${HOME}/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

PATH=$PATH:$NPM_PACKAGES/bin
PATH=$PATH:$HOME/.gem/ruby/2.4.0/bin
PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
export GPG_TTY=$(tty)

export GOPATH="/home/jds/.go"
PATH=$PATH:$GOPATH/bin
PATH=$PATH:$HOME/.cabal-sandbox/bin
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/bin
PATH=$PATH:$HOME/.cask/bin
PATH=$PATH:/usr/local/share/npm/bin

export PATH=$PATH:/usr/local/bin:/usr/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export NDN_ROOT=$HOME/ndn/ndn
