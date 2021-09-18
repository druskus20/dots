# Vi mode
bindkey -v

# https://superuser.com/questions/476532/how-can-i-make-zshs-vi-mode-behave-more-like-bashs-vi-mode
export KEYTIMEOUT=1   # Vi mode timeout for key sequences
bindkey -M vicmd '^[' undefined-key
bindkey -rM viins '^X'
bindkey -M viins '^X,' _history-complete-newer \
                 '^X/' _history-complete-older \
                 '^X`' _bash_complete-word

# Don't use vi mode in backward delete word/char because it cannot delete
# characters on the left of position you were in insert mode.
# !!! Not working?
zle -A .backward-kill-word vi-backward-kill-word
zle -A .backward-delete-char vi-backward-delete-char

# Use C + hjkl in completion menu.
bindkey -M menuselect '^J' vi-down-line-or-history
bindkey -M menuselect '^K' vi-up-line-or-history
bindkey -M menuselect '^H' vi-backward-char
bindkey -M menuselect '^L' vi-forward-char

# Keybindings 
bindkey "^[[1;5C" forward-word            # C-ArrowRight
bindkey "^[[1;5D" backward-word           # C-ArrowLeft
bindkey "^H"      backward-kill-word      # C-Backspace
bindkey "\e[3~"   delete-char             # Del
bindkey "^R"      fzf-history             # C-R

# Just delete char in command mode on backspace.
bindkey -M vicmd "^?" vi-backward-delete-char

# / to search through history
bindkey -M vicmd '/' fzf-history

# C-E to edit command in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M viins "^E" edit-command-line
bindkey -M vicmd "^E" edit-command-line

setopt NO_FLOW_CONTROL  # Disable Ctrl+S and Ctrl+Q 
