# Some systems, including Ubuntu, rename bat to batcat.
function bat() {
  if __command_exists batcat; then
    batcat "$@"
  else
    command bat "$@"
  fi
}
