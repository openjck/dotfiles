# Some systems, including Ubuntu, rename fd to fdfind.
function fd() {
  if __command_exists fdfind; then
    fdfind "$@"
  else
    command fd "$@"
  fi
}
