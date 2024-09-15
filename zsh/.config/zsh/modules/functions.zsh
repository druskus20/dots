function fzf-history() {
  RBUFFER="$(history -n 0 | fzf)"
}
zle -N fzf-history fzf-history 



# Kills all detached tmux sessions except 'main'
function tmux-kill-detached-sessions() {
  sessions=$(tmux list-sessions -F '#{session_attached} #{session_name}' | awk '/^0/{print $2}')
  for session (${(f)sessions}); do
    if [ "$session" != "main" ]; then
      tmux kill-session -t "$session" 2>/dev/null
    fi
  done
}
zle -N tmux-kill-detached-sessions tmux-kill-detached-sessions

# Call it when the shell exits (also when you close the terminal)
trap tmux-kill-detached-sessions EXIT

# tmux main
function tm() {
  if [ -z "$TMUX" ]; then
    # If run from outside tmux, (create?) and attach to main
    tmux attach-session -t main || tmux new-session -s main \; run-shell /home/drusk/.config/tmux/plugins/tmux-resurrect/scripts/restore.sh
  else 
    # If run from inside tmux, (create?) and switch to main
    tmux switch-client -t main || (tmux new-session -s main -d \; run-shell /home/drusk/.config/tmux/plugins/tmux-resurrect/scripts/restore.sh) && (tmux switch-client -t main && tmux-kill-detached-sessions)
  fi
}
zle -N tm tm

# Similar to `gunwip` but recursive "Unwips" all recent `--wip--` commits not just the last one
function gunwipall() {
  local _commit=$(git log --grep='--wip--' --invert-grep --max-count=1 --format=format:%H)

  # Check if a commit without "--wip--" was found and it's not the same as HEAD
  if [[ "$_commit" != "$(git rev-parse HEAD)" ]]; then
    git reset $_commit || return 1
  fi
}
zle -N gunwipall gunwipall


