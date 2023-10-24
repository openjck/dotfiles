# This would not work properly if it were a shell script. Shell scripts are
# executed in subshells, where "cd" does not affect the shell that called the
# script.
function mkcd() {
  local DIRECTORY=$1

  # When the `--parents` option is used, `mkdir` does not exit with an error
  # code if a directory already exists, so that case needs to be handled
  # manually.
  if [[ -d "$DIRECTORY" ]]; then
    >&2 echo "Directory already exists: $DIRECTORY"
  else
    if mkdir --parents "$DIRECTORY"; then
      cd "$DIRECTORY" || return 1
    fi
  fi
}
