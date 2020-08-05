#!/bin/bash

case $- in
    *i*) ;;
      *) return;;
esac

set -o vi
set editing-mode vi
set keymap vi

shopt -s checkjobs
shopt -s expand_aliases
shopt -s globstar
shopt -s histappend
shopt -s no_empty_cmd_completion
shopt -s nocaseglob

[ -n "$(command -v direnv)" ] && eval "$(direnv hook bash)" &
command -v pyenv 2>&1 >/dev/null && eval "$(pyenv init -)" &
eval "$(starship init bash)"

[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.bash_bindings ] && source ~/.bash_bindings

greetings
wait
