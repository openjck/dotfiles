function p-remove() {
  if [[ $DISTRO == "Ubuntu" ]]; then
    sudo apt remove --auto-remove "$@"
  else
    __print-unsupported-err
    return 1
  fi
}
