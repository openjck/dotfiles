function p-install() {
  if [[ $DISTRO == "Ubuntu" ]]; then
    sudo apt install --assume-yes "$@"
  else
    __print-unsupported-err
    return 1
  fi
}
