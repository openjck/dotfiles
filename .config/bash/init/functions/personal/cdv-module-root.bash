function cdv-module-root() {
  local MODULE_ROOT
  MODULE_ROOT=$(module-root)

  if [[ -n $MODULE_ROOT ]]; then
    cdv "$MODULE_ROOT"
  else
    return 1
  fi
}
