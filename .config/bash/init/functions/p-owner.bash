# Print the name of the package that owns the given filename.
function p-owner() {
  if [[ "$(__distro_base)" == debian ]]; then
    dpkg --search "$@"
  else
    __print-unsupported-err
    return 1
  fi
}
