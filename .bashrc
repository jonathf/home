#!/bin/bash

case $- in
    *i*) ;;
      *) return;;
esac

# stuff to make BASH behave nice
HISTCONTROL=ignoreboth
HISTSIZE=500000
HISTFILESIZE=100000
PROMPT_COMMAND='history -a'
EDITOR=nvim

set -o vi
set editing-mode vi
set keymap vi
bind '"jk":vi-movement-mode'

shopt -s histappend
shopt -s checkwinsize
shopt -s cmdhist
shopt -s cdspell
shopt -s expand_aliases
shopt -s autocd

bind "Space:magic-space"
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

bind "set show-mode-in-prompt on"
bind "set vi-ins-mode-string \1\033]12;White\007\2"
bind "set vi-cmd-mode-string \1\033]12;Red\007\2"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE="en"
export LC_MESSAGES="C"

export BROWSER=firefox
export EDITOR=nvim
export VISUAL=nvim

eval "$(direnv hook bash)"

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f ~/.bash_local ]] && . ~/.bash_local
[[ -f ~/.bash_prompt ]] && . ~/.bash_prompt

export PATH=$PATH:~/.local/bin

if [[ -d $HOME/.cargo ]]; then
    export CARGO_ROOT=$HOME/.cargo
    export PATH=$CARGO_ROOT/bin:$PATH
fi

if [[ -d $HOME/.pyenv ]]; then
    export PYENV_ROOT=$HOME/.pyenv
    export PATH=$PYENV_ROOT/bin:$PATH
    if command -v pyenv 1>/dev/null; then
        eval "$(pyenv init -)"
    fi
else
    echo "pyenv is missing; install by running: clone pyenv/pyenv ~/.pyenv"
fi

export DIRENV_LOG_FORMAT=
direnv_path=$(command -v direnv)
if [[ -n "$direnv_path" ]]; then
    eval "$(direnv hook bash)"
fi

eval "$(pipenv --completion)"

export PIPENV_VENV_IN_PROJECT=true
export PIPENV_DEFAULT_PYTHON_VERSION=3.6
export PIPENV_IGNORE_VIRTUALENVS=1

source /home/jonathf/.config/broot/launcher/bash/br
