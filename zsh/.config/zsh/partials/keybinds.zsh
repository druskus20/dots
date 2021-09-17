# Emacs mode
bindkey -e
# export KEYTIMEOUT=1   # Vi mode timeout for key sequences

setopt NO_FLOW_CONTROL  # Disable Ctrl+S and Ctrl+Q 

# Disable default keybinds
() {
  function do-nothing() {}
  zle -N do-nothing do-nothing

  local key keys=(
    "^A"   "^B"   "^D"   "^E"   "^F"   "^N"   "^O"   "^P"   "^Q"   "^S"   "^T"   "^W"
    "^X*"  "^X="  "^X?"  "^XC"  "^XG"  "^Xa"  "^Xc"  "^Xd"  "^Xe"  "^Xg"  "^Xh"  "^Xm"  "^Xn"
    "^Xr"  "^Xs"  "^Xt"  "^Xu"  "^X~"  "^[ "  "^[!"  "^['"  "^[,"  "^[-"  "^[."  "^[0"  "^[1"
    "^[2"  "^[3"  "^[4"  "^[5"  "^[6"  "^[7"  "^[8"  "^[9"  "^[<"  "^[>"  "^[?"  "^[A"  "^[B"
    "^[C"  "^[D"  "^[F"  "^[G"  "^[L"  "^[M"  "^[N"  "^[P"  "^[Q"  "^[S"  "^[T"  "^[U"  "^[W"
    "^[_"  "^[a"  "^[b"  "^[c"  "^[d"  "^[f"  "^[g"  "^[l"  "^[n"  "^[p"  "^[q"  "^[s"  "^[t"
    "^[u"  "^[w"  "^[y"  "^[z"  "^[|"  "^[~"  "^[^I" "^[^J" "^[^_" "^[\"" "^[\$" "^X^B"
    "^X^F" "^X^J" "^X^K" "^X^N" "^X^O" "^X^R" "^X^U" "^X^X" "^[^D" "^[^G")
  for key in $keys; do
    bindkey $key do-nothing
  done
}

# z4h bindkey z4h-backward-kill-word  Ctrl+Backspace
# z4h bindkey z4h-backward-kill-zword Ctrl+Alt+Backspace
# z4h bindkey z4h-cd-back             Alt+Left
# z4h bindkey z4h-cd-forward          Alt+Right
# z4h bindkey z4h-cd-up               Alt+Up
# z4h bindkey z4h-fzf-dir-history     Alt+Down
# z4h bindkey z4h-eof                 Ctrl+D



# Keybindings 
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
#bindkey '\e[2~'   overwrite-mode          # Insert
bindkey '\e[3~'   delete-char             # Del
bindkey '\e[5~'   history-search-backward # PgUp
bindkey '\e[6~'   history-search-forward  # PgDn
#bindkey '^A'      beginning-of-line       # Home
#bindkey '^D'      delete-char             # Del
#bindkey '^E'      end-of-line             # End
#bindkey '^R'      history-incremental-pattern-search-backward 
