function p-cleanup() {
  if [[ "$(__distro_base)" == debian ]]; then
    sudo apt autoremove "$@"
  else
    __print-unsupported-err
    return 1
  fi
}
