# Vi mode foldstart
bindkey -v

# https://superuser.com/questions/476532/how-can-i-make-zshs-vi-mode-behave-more-like-bashs-vi-mode
export KEYTIMEOUT=1   # Vi mode timeout for key sequences
bindkey -M vicmd '^[' undefined-key

# Remove keybinds that begin with esc (so ESC doesnt hang)
bindkey -M vicmd -r "^[OA"    # up-line-or-history
bindkey -M vicmd -r "^[OB"    # down-line-or-history
bindkey -M vicmd -r "^[OC"    # vi-forward-char
bindkey -M vicmd -r "^[OD"    # vi-backward-char
bindkey -M vicmd -r "^[[200~" # bracketed-paste
bindkey -M vicmd -r "^[[A"    # up-line-or-history
bindkey -M vicmd -r "^[[B"    # down-line-or-history
bindkey -M vicmd -r "^[[C"    # vi-forward-char
bindkey -M vicmd -r "^[[D"    # vi-backward-char

# Remove execute because Im dumb
bindkey -M vicmd -r ":"       # execute

bindkey -rM viins '^X'
bindkey -M viins '^X,' _history-complete-newer \
                 '^X/' _history-complete-older \
                 '^X`' _bash_complete-word

# Don't use vi mode in backward delete word/char because it cannot delete
# characters on the left of position you were in insert mode.
bindkey "^?" backward-delete-char
# foldend

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
#bindkey "^R"      fzf-history             # C-R
bindkey '^R' history-incremental-search-backward

bindkey "^E"      end-of-line             # C-E
bindkey "^A"      beginning-of-line       # C-A

# / to search through history
bindkey -M vicmd '/' fzf-history

# C-Q to edit command in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M viins "^Q" edit-command-line
bindkey -M vicmd "^Q" edit-command-line

# Make word boundaries (CTRL+Backspace) like bash
#autoload -U select-word-style
#select-word-style bash
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

setopt NO_FLOW_CONTROL  # Disable Ctrl+S and Ctrl+Q 

# vim:foldmarker=foldstart,foldend
