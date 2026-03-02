# This cannot be a shell script because shell scripts are executed in subshells
# and therefore cannot cause the parent shell (the shell that called the shell
# script) to navigate.

function cdv-module-root() {
  local MODULE_ROOT
  MODULE_ROOT=$(module-root)

  if [[ -n "$MODULE_ROOT" ]]; then
    cdv "$MODULE_ROOT"
  else
    >&2 echo "Error: Current directory is not a Drupal module."
    return 1
  fi
}
