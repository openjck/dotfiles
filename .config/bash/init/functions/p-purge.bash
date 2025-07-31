function p-purge() {
  if [[ $DISTRO == Ubuntu || $DISTRO == Debian ]]; then
    sudo apt purge --auto-remove "$@"
  else
    __print-unsupported-err
    return 1
  fi
}
