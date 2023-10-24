# Print the path to the root of the Drupal module we are navigated within, or
# return 1 if we are not navigated within a Drupal module.
#
# https://unix.stackexchange.com/a/293477/410447
function module-root() {
  # https://stackoverflow.com/a/1371283/715866
  local DIRNAME=${PWD##*/}

  if [[ -f "$DIRNAME.info.yml" ]]; then
    echo "$PWD"
  elif [[ "$PWD" == / ]]; then
    return 1
  else
    (cd .. && module-root)
  fi
}
