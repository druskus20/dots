#             _                
#    _______| |__  _ __ ___ 
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__ 
# (_)___|___/_| |_|_|  \___|
#                           
#  By Druskus               
#

# General Setting foldstart
# History in cache directory:
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# I think this autocompletes from the middle of the word
zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
# foldend

# Partials foldstart
() {
  local partials=(
    "keybinds" # Has to be before plugins
    "alias"
    "prompt"
  )

  for partial in $partials; do
    source "$XDG_CONFIG_HOME/zsh/partials/$partial.zsh"
  done
}
# foldend

# Plugins foldstart
() {
  local plugins=(

    # installed through pacman, no need to source, might need to run compinit
    #  (in usr/share/zsh/site-functions)
    # "zsh-completions"
   
    # "zsh-vi-mode"
    "zsh-autosuggestions"
    "zsh-syntax-highlighting"
    "zsh-history-substring-search"   
    "zsh-you-should-use" # This is annoying, the actual name is: zsh-you-should-use/you-should-use.plugin.zsh 
  )

  for plugin in $plugins; do
    if [ -f "/usr/share/zsh/plugins/$plugin/$plugin.plugin.zsh" ]; then
      source "/usr/share/zsh/plugins/$plugin/$plugin.plugin.zsh"
    elif [ -f "/usr/share/zsh/plugins/$plugin/$plugin.zsh" ]; then
      source "/usr/share/zsh/plugins/$plugin/$plugin.zsh"
    else 
      echo "zshrc: Error couldn't load \"$plugin\"."
    fi

    [ -f "$XDG_CONFIG_HOME/zsh/plugins/$plugin.zsh" ] && source "$XDG_CONFIG_HOME/zsh/plugins/$plugin.zsh"
  done
}

# Some quick plugin settings
export ZSH_HIGHLIGHT_MAXLENGTH=100
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="#ffffff"
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
setopt SHARE_HISTORY           # write and import history on every command
# setopt INC_APPEND_HISTORY  # shouldnt be enabled at the same time as SHARE_HISTORY
# setopt HIST_VERIFY             # if a command triggers history expansion, show it instead of running
# setopt NO_BANG_HIST            # disable old history syntax

# ZLE
setopt NOBEEP

# OTHER
# setopt INTERACTIVE_COMMENTS    # allow comments in command line
# setopt PATH_DIRS               # perform path search even on command names with slashes
# setopt C_BASES                 # print hex/oct numbers as 0xFF/077 instead of 16#FF/8#77
# foldend

# vim:foldmarker=foldstart,foldend
