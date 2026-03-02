# This cannot be a shell script because shell scripts cannot easily shadow other
# commands.

# Debian-based systems, and possibly others, rename fd to fdfind.
function fd() {
  if __command_exists fdfind; then
    fdfind "$@"
  else
    command fd "$@"
  fi
}
