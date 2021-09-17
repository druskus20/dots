# Druskus rainbow-like zsh theme
# Features: 
# 	- Last command status indicator
#	- Git indicator
#
# Requirements:
# 	- nerd-fonts: \ue702 for the git symbol
# 	- powerline fonts

# Enable colors and change prompt:
autoload -U colors && colors

# This allows expansions
setopt PROMPT_SUBST

# This part is for the virtualenv indicator
export VIRTUAL_ENV_DISABLE_PROMPT=yes

function virtenv_indicator {
    if [[ -z $VIRTUAL_ENV ]] then
        psvar[1]=''
    else
        psvar[1]="${VIRTUAL_ENV##*/}"
    fi
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd virtenv_indicator

# This needs to be in simple quotes
# https://unix.stackexchange.com/questions/32124/set-variables-in-zsh-precmd-and-reference-them-in-the-prompt

PROMPT='%B'
PROMPT+='%F{black}%(?:%K{green} ✓%F{green}%K{yellow}:%K{red} ✕%F{red}%K{yellow})'
PROMPT+='%F{black}%n'
PROMPT+='%F{yellow}%K{blue}'
PROMPT+='%F{black}%m'
PROMPT+='%F{blue}%K{magenta}'
PROMPT+='%F{black}%K{magenta}%2.'
PROMPT+='$(git rev-parse --is-inside-work-tree &>/dev/null && echo "  ")'
PROMPT+='%F{magenta}'
PROMPT+='%k%b%f '
