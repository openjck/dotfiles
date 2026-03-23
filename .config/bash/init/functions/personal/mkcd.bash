# This cannot be a shell script because shell scripts are executed in subshells
# and therefore cannot cause the parent shell (the shell that called the shell
# script) to navigate.

function mkcd() {
  local DIRECTORY=$1

  # When the `--parents` option is used, `mkdir` does not exit with an error
  # code if a directory already exists, so that case needs to be handled
  # manually.
  if [[ -d $DIRECTORY ]]; then
    >&2 echo "Directory already exists: $DIRECTORY"
  else
    if mkdir --parents "$DIRECTORY"; then
      cd "$DIRECTORY" || return 1
    fi
  fi
}
