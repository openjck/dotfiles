function p-info() {
  if [[ $DISTRO == Ubuntu || $DISTRO == Debian ]]; then
    apt show "$@"
  else
    __print-unsupported-err
    return 1
  fi
}
