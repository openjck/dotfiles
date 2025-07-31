function p-cleanup() {
  if [[ $DISTRO == Ubuntu || $DISTRO == Debian ]]; then
    sudo apt autoremove "$@"
  else
    __print-unsupported-err
    return 1
  fi
}
