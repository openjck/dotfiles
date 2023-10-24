function p-files() {
  if [[ $DISTRO == "Ubuntu" ]]; then
    dpkg-query --listfiles "$@"
  else
    __print-unsupported-err
    return 1
  fi
}
