function shfmt() {
  command shfmt --write --list --simplify --case-indent --indent 2 "$@"
}
