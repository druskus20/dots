#             _                
#    _______| |__  _ __ ___ 
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__ 
# (_)___|___/_| |_|_|  \___|
#                           
#  By Druskus               
#

# General Setting foldstart
source "$ZDOTDIR/utils/utils.zsh"

# History in cache directory:
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$XDG_CACHE_HOME"/zsh/history

# Clear default keybinds
clear-keybinds

# Basic auto/tab complete:
autoload -U compinit
zmodload zsh/complist
zstyle ':completion:*' menu select
# Include hidden files.
_comp_options+=(globdots)		
# Autocomplete from the middle of the word
zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
compinit
# foldend

# Partials foldstart
source "$ZDOTDIR/partials/keybinds.zsh"
source "$ZDOTDIR/partials/alias.zsh"
source "$ZDOTDIR/partials/prompt.zsh"
# foldend

# Plugins foldstart

# installed through pacman, no need to source, might need to run compinit
#  (in usr/share/zsh/site-functions)
# load-plugin "zsh-completions"

load-plugin    "zsh-autosuggestions"
#load-plugin    "zsh-syntax-highlighting"
load-plugin    "fast-syntax-highlighting"
load-plugin    "zsh-history-substring-search"   
load-plugin    "zsh-you-should-use" # This is annoying, the actual name is: zsh-you-should-use/you-should-use.plugin.zsh 
# load-plugin "zsh-vi-mode"

# Some quick plugin settings
ZSH_HIGHLIGHT_MAXLENGTH=100  
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#85858f,bold,underline"
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# foldend

# Options foldstart
# Completion
setopt AUTO_LIST               # automatically list choices on ambiguous completion
setopt AUTO_MENU               # show completion menu on a successive tab press
setopt AUTO_PARAM_SLASH        # if completed parameter is a directory, add a trailing slash
setopt COMPLETE_IN_WORD        # complete from the cursor rather than from the end of the word
setopt NO_MENU_COMPLETE        # do not autoselect the first completion entry
setopt HASH_LIST_ALL
setopt ALWAYS_TO_END

# History
setopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY             # write and import history on every command

# OTHER
setopt INTERACTIVE_COMMENTS    # allow comments in command line
setopt NOBEEP
# foldend

# vim:foldmarker=foldstart,foldend
