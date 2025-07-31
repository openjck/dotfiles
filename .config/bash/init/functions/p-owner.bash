# Print the name of the package that owns the given filename.
function p-owner() {
  if [[ $DISTRO == Ubuntu || $DISTRO == Debian ]]; then
    dpkg --search "$@"
  else
    __print-unsupported-err
    return 1
  fi
}
