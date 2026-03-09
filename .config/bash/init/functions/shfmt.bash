function shfmt() {
  # We _do_ want this environment variable to be word-split, because each option
  # should be passed to `shfmt` as a separate option. If the environment
  # variable were surrounded by quotes, `shfmt` would treat the entire string as
  # one option and raise an error about that option not existing.
  #
  # shellcheck disable=SC2086
  command shfmt --write --list $SHFMT_FORMATTING_FLAGS "$@"
}
