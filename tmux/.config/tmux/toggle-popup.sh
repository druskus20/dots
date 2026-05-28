#!/bin/bash

# Get current session name
CURRENT_SESSION=$(tmux display-message -p '#{session_name}')

# If we're in the popup session, detach (hide it)
if [ "$CURRENT_SESSION" = "popup" ]; then
    tmux detach-client
    exit 0
fi

# Check if popup session has any clients attached (is visible)
if tmux has-session -t popup 2>/dev/null; then
    CLIENT_COUNT=$(tmux list-clients -t popup 2>/dev/null | wc -l)
    if [ "$CLIENT_COUNT" -gt 0 ]; then
        # Popup is visible, do nothing to prevent nesting
        exit 0
    fi
fi

# Open the popup
tmux display-popup -E -d "#{pane_current_path}" -w 90% -h 90% "tmux new-session -A -s popup"
