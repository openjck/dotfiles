function c-module-root() {
  local MODULE_ROOT
  MODULE_ROOT=$(module-root)

  if [[ -n "$MODULE_ROOT" ]]; then
    cdv "$MODULE_ROOT"
  else
    >&2 echo "Error: Not a Drupal module"
  fi
}
