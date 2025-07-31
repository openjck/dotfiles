function p-files() {
  if [[ $DISTRO == Ubuntu || $DISTRO == Debian ]]; then
    dpkg-query --listfiles "$@"
  else
    __print-unsupported-err
    return 1
  fi
}
