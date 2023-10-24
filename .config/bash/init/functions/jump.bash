# Use fzf to navigate to the home directory or to any directory that has a `$D_`
# environment variable associated with it.
function jump() {
  local D_PATHS
  local HOME_PLUS_D_PATHS

  D_PATHS=$(env | grep '^D_' | sed 's/^.*=//' | sort)

  # Add $HOME, followed by a newline, followed by all other paths, which are
  # already separated by newlines.
  #
  # https://stackoverflow.com/a/9139891/715866
  HOME_PLUS_D_PATHS="$HOME"$'\n'"$D_PATHS"

  if SELECTION=$(fzf <<< "$HOME_PLUS_D_PATHS"); then
    cdv "$SELECTION"
  fi
}
