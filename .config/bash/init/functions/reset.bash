function reset() {
  if [[ -n "$TMUX" ]]; then
    command reset && tmux clear-history
  else
    command reset
  fi
}
