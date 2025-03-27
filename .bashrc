#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History 
export HISTSIZE=-1
export HISTFILESIZE=-1
export HISTCONTROL=ignoreboth,erasedups
export HISTIGNORE="history:?:??:exit:sudo pacman -Syyu:sudo apt update && sudo apt update:open .:?? .."
shopt -s histappend
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Only show 3 dir names in prompt
export PROMPT_DIRTRIM=3

# Variables
export SVN_EDITOR=hx
export EDITOR=hx
export COLORTERM=truecolor

# Prompt
if $(declare -f __git_ps1 > /dev/null); then
    PS1='\[\e[34;1m\]\w\[\e[32;1m\]$(__git_ps1)\[\e[35;1m\] > \[\e[0m\]'
else
    PS1='\[\e[34;1m\]\w\[\e[35;1m\] > \[\e[0m\]'
fi

# Aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Start TMUX and attach to a session if one exists
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    tmux new-session -d -s main; tmux new-session -t main \; set-option destroy-unattached
fi

eval "$(direnv hook bash)"
