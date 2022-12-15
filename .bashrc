#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History 
HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth
HISTIGNORE="history:?:??:exit:sudo pacman -Syyu:sudo apt update && sudo apt update"

# Aliases
alias l="ls --color=auto"
alias ls="ls --color=auto"
alias la="ls -a --color=auto"
alias ll="ls -l --color=auto"

alias grep="grep --color=auto"
alias ytm="yt-dlp -x --audio-format mp3 --add-metadata --embed-thumbnail"

# Variables
export SVN_EDITOR=vim
export EDITOR=vim

# Prompt
if [ -f /usr/lib/git-core/git-sh-prompt ]; then
    source /usr/lib/git-core/git-sh-prompt
    git_prompt="true"
fi

if [ -n "$git_prompt" ]; then
    PS1='\[\e[35\];1m\u\[\e[0;1m\]: \[\e[34;1m\]\w\[\e[32;1m\]$(__git_ps1) \[\e[0m\]\$ '
else
    PS1='\[\e[35\];1m\u\[\e[0;1m\]: \[\e[34;1m\]\w \[\e[0m\]\$ '
fi
