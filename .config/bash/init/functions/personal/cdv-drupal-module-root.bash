function cdv-drupal-module-root() {
  local DRUPAL_MODULE_ROOT
  DRUPAL_MODULE_ROOT=$(drupal-module-root)

  if [[ -n $DRUPAL_MODULE_ROOT ]]; then
    cdv "$DRUPAL_MODULE_ROOT"
  else
    return 1
  fi
}
