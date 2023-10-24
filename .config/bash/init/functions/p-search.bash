function p-search() {
  if [[ $DISTRO == "Ubuntu" ]]; then
    apt search "$@"
  else
    __print-unsupported-err
    return 1
  fi
}
