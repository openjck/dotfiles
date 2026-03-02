# This cannot be a shell script because shell scripts cannot easily shadow other
# commands.

function reset() {
  if [[ -n "$TMUX" ]]; then
    command reset && tmux clear-history
  else
    command reset
  fi
}
