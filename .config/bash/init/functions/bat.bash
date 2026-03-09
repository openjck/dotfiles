# Debian-based systems, and possibly others, rename bat to batcat.
function bat() {
  if __command_exists batcat; then
    batcat "$@"
  else
    command bat "$@"
  fi
}
