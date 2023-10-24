function p-purge() {
  if [[ $DISTRO == "Ubuntu" ]]; then
    sudo apt purge --auto-remove "$@"
  else
    __print-unsupported-err
    return 1
  fi
}
