function fzf-history() {
  RBUFFER="$(history -n 0 | fzf)"
}
zle -N fzf-history fzf-history 

# Kills all detached tmux sessions except 'main'
function tmux-kill-detached-sessions() {
  sessions=$(tmux list-sessions -F '#{session_attached} #{session_name}' | awk '/^0/{print $2}')
  for session (${(f)sessions}); do
    if [ "$session" != "main" ]; then
      tmux kill-session -t "$session"
    fi
  done
}

zle -N tmux-kill-detached-sessions tmux-kill-detached-sessions

# Call it when the shell exits (also when you close the terminal)
trap tmux-kill-detached-sessions EXIT
