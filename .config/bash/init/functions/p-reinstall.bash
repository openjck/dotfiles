function p-reinstall() {
  if [[ $DISTRO == "Ubuntu" ]]; then
    sudo apt reinstall --assume-yes "$@"
  else
    __print-unsupported-err
    return 1
  fi
}
