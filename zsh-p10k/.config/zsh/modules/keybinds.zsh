function clear-keybinds() {
  typeset -a keys=(
    "^A"   "^B"   "^D"   "^E"   "^F"   "^N"   "^O"   "^P"   "^Q"   "^S"   "^T"   "^W"   "^K"
    "^X*"  "^X="  "^X?"  "^XC"  "^XG"  "^Xa"  "^Xc"  "^Xd"  "^Xe"  "^Xg"  "^Xh"  "^Xm"  "^Xn"
    "^Xr"  "^Xs"  "^Xt"  "^Xu"  "^X~"  "^[ "  "^[!"  "^['"  "^[,"  "^[-"  "^[."  "^[0"  "^[1"
    "^[2"  "^[3"  "^[4"  "^[5"  "^[6"  "^[7"  "^[8"  "^[9"  "^[<"  "^[>"  "^[?"  "^[A"  "^[B"
    "^[C"  "^[D"  "^[F"  "^[G"  "^[L"  "^[M"  "^[N"  "^[P"  "^[Q"  "^[S"  "^[T"  "^[U"  "^[W"
    "^[_"  "^[a"  "^[b"  "^[c"  "^[d"  "^[f"  "^[g"  "^[l"  "^[n"  "^[p"  "^[q"  "^[s"  "^[t"
    "^[u"  "^[w"  "^[y"  "^[z"  "^[|"  "^[~"  "^[^I" "^[^J" "^[^_" "^[\"" "^[\$" "^X^B"
    "^X^F" "^X^J" "^X^K" "^X^N" "^X^O" "^X^R" "^X^U" "^X^X" "^[^D" "^[^G")
  
  # Use bindkey -r with multiple arguments
  bindkey -r "${keys[@]}"
}

clear-keybinds

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

bindkey -M vicmd -r "^[[2~"   # vi-insert
bindkey -M vicmd -r "^[[3~"   # vi-delete-char


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
# requires zmodload -i zsh/complist
bindkey -M menuselect '^J' vi-down-line-or-history
bindkey -M menuselect '^K' vi-up-line-or-history
bindkey -M menuselect '^H' vi-backward-char
bindkey -M menuselect '^L' vi-forward-char

# Keybindings 
bindkey "^[[1;5C" forward-word            # C-ArrowRight
bindkey "^[[1;5D" backward-word           # C-ArrowLeft
bindkey "^H"      backward-kill-word      # C-Backspace
bindkey "\e[3~"   delete-char             # Del
bindkey '^R' history-incremental-search-backward

bindkey "^E"      end-of-line             # C-E
bindkey "^B"      beginning-of-line       # C-B

# / to search through history
bindkey -M vicmd '^O' fzf-history
bindkey -M viins '^O' fzf-history

# C-A to edit command in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M viins "^A" edit-command-line
bindkey -M vicmd "^A" edit-command-line

# C-Z to fg - this allows me to use C-Z to send a process to 
# background (i.e. vim) and the same binding bring it back
fg-func() {
    fg 2>/dev/null || echo "No stopped jobs"
}
zle -N fg-func
bindkey '^Z' fg-func 



# Make word boundaries (CTRL+Backspace) like bash
#autoload -U select-word-style
#select-word-style bash
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

setopt NO_FLOW_CONTROL  # Disable Ctrl+S and Ctrl+Q 

# vim:foldmarker=foldstart,foldend
