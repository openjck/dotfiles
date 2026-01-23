function p-remove() {
  if [[ "$(__distro_base)" == debian ]]; then
    sudo apt remove --auto-remove "$@"
  else
    __print-unsupported-err
    return 1
  fi
}
