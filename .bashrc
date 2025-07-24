#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History 
shopt -s histappend
# Unlimited history size
export HISTSIZE=-1
export HISTFILESIZE=-1
export HISTCONTROL=ignoreboth,erasedups
export HISTIGNORE="history:?:??:exit:sudo pacman -Syyu:sudo apt update && sudo apt update:open .:?? .."
# Append to history on each command
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
alias l="ls --color=auto"
alias ls="ls --color=auto"
alias la="ls -a --color=auto"
alias ll="ls -l --color=auto"
alias grep="grep --color=auto"
alias ytm="yt-dlp -x --audio-format opus --add-metadata --embed-thumbnail"

# Start TMUX and attach to a session if one exists
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    tmux new-session -d -s main; tmux new-session -t main \; set-option destroy-unattached
fi

if command -v direnv &> /dev/null; then
    eval "$(direnv hook bash)"
fi

if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi

if command -v jj &> /dev/null; then
    source <(jj util completion bash)
fi
