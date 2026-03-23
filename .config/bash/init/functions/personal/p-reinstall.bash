function p-reinstall() {
  if [[ "$(__distro_base)" == debian ]]; then
    sudo apt reinstall --assume-yes "$@"
  else
    __print-unsupported-err
    return 1
  fi
}
