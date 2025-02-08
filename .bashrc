#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History 
HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth
HISTIGNORE="history:?:??:exit:sudo pacman -Syyu:sudo apt update && sudo apt update:open .:?? .."

# Only show 3 dir names in prompt
PROMPT_DIRTRIM=3

# Variables
export SVN_EDITOR=vim
export EDITOR=vim
export COLORTERM=truecolor

# Prompt
# Script Location on Ubuntu
if [ -f /usr/lib/git-core/git-sh-prompt ]; then
    source /usr/lib/git-core/git-sh-prompt
    git_prompt="true"
else
    # Script Location on Arch Linux
    if [ -f /usr/share/git/completion/git-prompt.sh ]; then
        source /usr/share/git/completion/git-prompt.sh
        git_prompt="true"
    fi
fi

if [ -n "$git_prompt" ]; then
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
