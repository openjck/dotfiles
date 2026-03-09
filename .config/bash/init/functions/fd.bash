# Debian-based systems, and possibly others, rename fd to fdfind.
function fd() {
  if __command_exists fdfind; then
    fdfind "$@"
  else
    command fd "$@"
  fi
}
