function do-nothing() {}
zle -N do-nothing do-nothing

# Disable default keybinds
function clear-keybinds() {
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
zle -N clear-keybinds clear-keybinds

function load-plugin() {
    if [ -f "/usr/share/zsh/plugins/$1/$1.plugin.zsh" ]; then
      source "/usr/share/zsh/plugins/$1/$1.plugin.zsh"
    elif [ -f "/usr/share/zsh/plugins/$1/$1.zsh" ]; then
      source "/usr/share/zsh/plugins/$1/$1.zsh"
    else 
      echo "zshrc: Error couldn't load \"$1\"."
    fi
    [ -f "$ZDOTDIR/plugins/$1.zsh" ] \
      && source "$ZDOTDIR/plugins/$1.zsh"
}
zle -N load-plugin load-plugin
