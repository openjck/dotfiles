function p-install() {
  if [[ $DISTRO == Ubuntu || $DISTRO == Debian ]]; then
    sudo apt install --assume-yes "$@"
  else
    __print-unsupported-err
    return 1
  fi
}
