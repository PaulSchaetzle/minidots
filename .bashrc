#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias :q="exit"
alias clr="clear"

alias l="ls --color=auto"
alias ls="ls --color=auto"
alias la="ls -a --color=auto"
alias ll="ls -l --color=auto"

alias v="vim"
alias grep="grep --color=auto"
alias ytm="yt-dlp -x --audio-format mp3 --add-metadata --embed-thumbnail"

# Variables
export SVN_EDITOR=vim
export EDITOR=vim

# Prompt
PS1='\[\e[35\];1m\342\224\214\342\224\200\u\[\e[0;1m\]@\[\e[36;1m\]\h\[\e[34;1m\][\w]\n\[\e[35;1m\]\342\224\224\342\224\200\342\224\200>\[\e[0m\]\$ '
