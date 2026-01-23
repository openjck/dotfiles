function p-info() {
  if [[ "$(__distro_base)" == debian ]]; then
    apt show "$@"
  else
    __print-unsupported-err
    return 1
  fi
}
