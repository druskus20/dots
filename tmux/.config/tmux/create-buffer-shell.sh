#!/bin/bash

SESSION_FILE="/tmp/next_tmux_session"
if [ ! -f "$SESSION_FILE" ]; then
    echo "0" > "$SESSION_FILE" 
fi

SESSION_NUMBER=$(cat "$SESSION_FILE")
if [ -z "$SESSION_NUMBER" ]; then
    echo "Session number is empty in $SESSION_FILE."
    exit 1
fi

tmux rename-session "tmux-$SESSION_NUMBER"

# Increment the session number and update the session file
NEXT_SESSION_NUMBER=$((SESSION_NUMBER + 1))
echo "$NEXT_SESSION_NUMBER" > "$SESSION_FILE"

# Create a new "buffer" session if none exists
BUFFER_SESSION_COUNT=$(tmux list-sessions | grep -c "^buffer$")
if [ "$BUFFER_SESSION_COUNT" -eq 0 ]; then
    tmux new-session -d -s "buffer"
fi

