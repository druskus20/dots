#!/bin/bash

# List all unattached tmux sessions
unattached_sessions="$(tmux ls | awk '!/\(attached\)/ {gsub(/:$/, "", $1); print $1}')"

# Get all active tmux sessions
for session_name in $unattached_sessions; do
  # Regex to match numeric or `tmux-<number>` pattern
  if [[ "$session_name" =~ ^[0-9]+$ ]] || [[ "$session_name" =~ ^tmux-[0-9]+$ ]]; then
      tmux kill-session -t "$session_name"
  fi
done

