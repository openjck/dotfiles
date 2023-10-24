function p-cleanup() {
  if [[ $DISTRO == "Ubuntu" ]]; then
    sudo apt autoremove "$@"
  else
    __print-unsupported-err
    return 1
  fi
}
