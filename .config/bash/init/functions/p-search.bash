function p-search() {
  if [[ $DISTRO == Ubuntu || $DISTRO == Debian ]]; then
    apt-cache search "$@"
  else
    __print-unsupported-err
    return 1
  fi
}
