# Run sl with a random combination of arguments and allow it to be interrupted
# with Ctrl+C.
function sl() {
  # Allow interrupting sl with Ctrl+C.
  local ARGUMENTS=('-e')

  # All options that sl accepts, except -e, which is already set above.
  local SL_OPTIONS=(
    '-a'
    '-l'
    '-F'
  )

  for SL_OPTION in "${SL_OPTIONS[@]}"; do
    # Flip a coin...
    if [[ $((RANDOM % 2)) -eq 0 ]]; then
      ARGUMENTS+=("$SL_OPTION")
    fi
  done

  command sl "${ARGUMENTS[@]}"
}
