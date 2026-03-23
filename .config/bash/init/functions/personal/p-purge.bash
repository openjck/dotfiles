function p-purge() {
  if [[ "$(__distro_base)" == debian ]]; then
    sudo apt purge --auto-remove "$@"
  else
    __print-unsupported-err
    return 1
  fi
}
