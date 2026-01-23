function p-search-all() {
  local COMMAND_NAME="${FUNCNAME[0]}"

  if [[ $# != 1 ]]; then
    >&2 echo "Search all configured package repositories with the given query."
    >&2 echo
    >&2 echo "Usage: $COMMAND_NAME QUERY"
    return 1
  fi

  declare -A SEARCHERS

  if [[ "$(__distro_base)" == debian ]]; then
    # Bash doesn't support multi-dimensional arrays, so these try to emulate
    # multi-dimensional arrays. This approach takes inspiration from docopts.
    SEARCHERS[0,name]=apt
    SEARCHERS[0,command]=apt-cache
    SEARCHERS[0,args]=search

    SEARCHERS[1,name]=flatpak
    SEARCHERS[1,command]=flatpak
    SEARCHERS[1,args]=search

    SEARCHERS[2,name]=snap
    SEARCHERS[2,command]=snap
    SEARCHERS[2,args]=search
  else
    __print-unsupported-err
    return 1
  fi

  local QUERY=$1
  local MAX_TEXT_WIDTH=80
  local HEADER_CHARACTER=―

  # This for loop should run indefinitely. The second expression must be an
  # arithmetic expression, though, so `true` cannot be used.
  for ((I=0; 0 < 1; I++)); do
    NAME=${SEARCHERS[$I,name]}

    # Break if we've passed the end of the associative array.
    [[ -z "$NAME" ]] && break;

    HEADER_START="${HEADER_CHARACTER}${HEADER_CHARACTER}${HEADER_CHARACTER} $NAME "
    HEADER_START_LENGTH=$(wc --chars <<< "$HEADER_START")
    NUM_TRAILING_CHARACTERS=$((MAX_TEXT_WIDTH - HEADER_START_LENGTH))

    # Print the header.
    echo -n "$HEADER_START"
    for ((J=0; J < NUM_TRAILING_CHARACTERS; J++)); do
      echo -n $HEADER_CHARACTER
    done
    echo

    # Run the command.
    "${SEARCHERS[$I,command]}" "${SEARCHERS[$I,args]}" "$QUERY"

    # Print a newline after the command's output.
    echo
  done
}
