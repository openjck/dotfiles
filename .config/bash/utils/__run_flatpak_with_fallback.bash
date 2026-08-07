function __run_flatpak_with_fallback() {
  local FLATPAK_IDENTIFIER=$1
  local FALLBACK_COMMAND=$2

  # The third argument to this function through the last argument to this
  # function, inclusive.
  #
  # https://stackoverflow.com/a/9057392/715866
  local APP_ARGUMENTS=("${@:3}")

  if flatpak info "$FLATPAK_IDENTIFIER" &>/dev/null; then
    flatpak run "$FLATPAK_IDENTIFIER" "${APP_ARGUMENTS[@]}"
  else
    # "command" needs to be used here because the value of "$FALLBACK_COMMAND"
    # is very likely also the name of the function that called this utility, and
    # we don't want to enter an infinite loop.
    command $FALLBACK_COMMAND "${APP_ARGUMENTS[@]}"
  fi
}
