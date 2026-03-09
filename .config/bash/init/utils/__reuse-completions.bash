# Use the completion of the first named command as the completion of the second
# named command. For example, if we were doing the following:
#
#   function g() {
#     git "$@"
#   }
#
#   __reuse-completions git g
#
# ...then we would be able to type "g b<tab>" and "branch" would be among the
# suggestions.
function __reuse-completions() {
  local original_command=$1
  local new_command=$2

  # Load the completion of the original command if it has not been loaded
  # already.
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
  if ! spec=$(complete -p "$original_command" 2> /dev/null); then
    _completion_loader "$original_command"

    if ! spec=$(complete -p "$original_command" 2> /dev/null); then
      return 1
    fi
  fi

  local command_to_set_new_completion

  # Note carefully that the "$" character is used in the search pattern to
  # ensure that "$original_command" is only replaced at the END of "$spec".
  command_to_set_new_completion=${spec//$original_command$/$new_command}

  eval "$command_to_set_new_completion"
}
