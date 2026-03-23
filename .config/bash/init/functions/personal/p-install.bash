function p-install() {
  if [[ "$(__distro_base)" == debian ]]; then
    sudo apt install --assume-yes "$@"
  else
    __print-unsupported-err
    return 1
  fi
}
