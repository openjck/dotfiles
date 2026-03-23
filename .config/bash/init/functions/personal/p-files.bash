function p-files() {
  if [[ "$(__distro_base)" == debian ]]; then
    dpkg-query --listfiles "$@"
  else
    __print-unsupported-err
    return 1
  fi
}
