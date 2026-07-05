#!/bin/bash

# 1. Kill unattached tmux-<number> sessions
unattached_sessions="$(tmux ls 2>/dev/null | awk '!/\(attached\)/ {gsub(/:$/, "", $1); print $1}')"

for session_name in $unattached_sessions; do
  # Regex to match numeric or `tmux-<number>` pattern (not popup sessions)
  if [[ "$session_name" =~ ^[0-9]+$ ]] || [[ "$session_name" =~ ^tmux-[0-9]+$ ]]; then
      tmux kill-session -t "$session_name" 2>/dev/null
  fi
done

# 2. Kill orphan popup sessions whose parent no longer exists
all_sessions="$(tmux ls -F '#{session_name}' 2>/dev/null)"

for session_name in $all_sessions; do
  # Check if this is a popup session
  if [[ "$session_name" =~ ^popup- ]]; then
      # Extract parent session name (remove "popup-" prefix)
      parent="${session_name#popup-}"
      # If parent doesn't exist, kill the popup
      if ! tmux has-session -t "$parent" 2>/dev/null; then
          tmux kill-session -t "$session_name" 2>/dev/null
      fi
  fi
done
