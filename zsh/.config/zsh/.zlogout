# List and kill all non-main *detached* tmux sessions
sessions=$(tmux list-sessions -F '#{session_attached} #{session_name}' | \ awk '/^0/{print $2}')
echo sessions
#sessions=$(tmux list-sessions | awk 'BEGIN{FS=":"}{print $1}')
for session (${(f)sessions}); do
  if [ "$session" != "main" ]; then
    tmux kill-session -t "$session"

  fi
done


