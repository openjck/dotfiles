# Use auto-completions of the first command as auto-completions for the second
# command. For example, if we were to do the following:
#
#   alias g="git"
#   __reuse-completions git g
#
# ...then we would be able to type "g b<tab>" and "branch" would be among the
# suggestions.
function __reuse-completions() {
  local ORIGINAL_COMMAND=$1
  local NEW_COMMAND=$2

  # Load completion for the original command if it has not been loaded already.
  #
  # It appears that completion is loaded for most commands on demand. For
  # example, the completion for the "git" command is not loaded until "git" is
  # typed, followed by two tabs, in an interactive session.
  #
  # On the other hand, some commands already have completion loaded at this
  # point and loading them again will modify the completion and change behavior.
  # For example, the "cd" command already has completion loaded at this point
  # and loading it again will modify the completion such that cdable_vars no
  # longer works.
  if ! complete -p "$ORIGINAL_COMMAND" &> /dev/null; then
    _completion_loader "$ORIGINAL_COMMAND"
  fi

  if complete -p "$ORIGINAL_COMMAND" &> /dev/null; then
    local NEW_COMPLETION_COMMAND
    NEW_COMPLETION_COMMAND=$(complete -p "$ORIGINAL_COMMAND" | sed "s/$ORIGINAL_COMMAND$/$NEW_COMMAND/")
    eval "$NEW_COMPLETION_COMMAND"
  fi
}
