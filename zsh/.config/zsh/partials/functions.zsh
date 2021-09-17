function fzf-history() {
  RBUFFER="$(history -n 0 | sort -u | uniq | fzf)"
}
zle -N fzf-history fzf-history 
