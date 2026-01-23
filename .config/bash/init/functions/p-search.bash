function p-search() {
  if [[ "$(__distro_base)" == debian ]]; then
    apt-cache search "$@"
  else
    __print-unsupported-err
    return 1
  fi
}
