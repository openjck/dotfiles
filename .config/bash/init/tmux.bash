# Automatically create and attach to a new tmux session.
if __command_exists tmux && [[ -n "$PS1" ]] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux && exit
fi
