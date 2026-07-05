#!/bin/bash

# Get current session name
CURRENT_SESSION=$(tmux display-message -p '#{session_name}')

# If we're already in a popup session, detach (hide it)
if [[ "$CURRENT_SESSION" =~ ^popup(-.*)?$ ]]; then
    tmux detach-client >/dev/null
    exit 0
fi

POPUP_SESSION="popup-${CURRENT_SESSION}"
STATE_FILE="/tmp/tmux-popup-${CURRENT_SESSION}"

# Check if a popup is already open using state file
if [ -f "$STATE_FILE" ] && kill -0 $(cat "$STATE_FILE" 2>/dev/null) 2>/dev/null; then
    # Popup is already open, do nothing
    exit 0
fi

# Create the popup session if it doesn't exist and disable status bar
if ! tmux has-session -t "$POPUP_SESSION" >/dev/null; then
    CURRENT_PATH=$(tmux display-message -p '#{pane_current_path}')
    tmux new-session -d -s "$POPUP_SESSION" -c "$CURRENT_PATH" > /dev/null
    tmux set -t "$POPUP_SESSION" status off > /dev/null
fi

# Open the popup and track the PID
echo $$ > "$STATE_FILE"
tmux display-popup -E -s "bg=#ede0b5" -S "fg=#ede0b5,bg=#ede0b5" -d "#{pane_current_path}" -w 90% -h 90% "tmux attach -t $POPUP_SESSION"
rm -f "$STATE_FILE"
