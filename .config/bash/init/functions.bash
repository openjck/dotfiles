# Source global Bash functions.
#
# This must be done after cdable_vars is enabled because the "c" function reuses
# the "cd" completion, which is altered when cdable_vars is enabled.
#
# Use a function so that the environment variables that are used are not made
# available to the interactive shell.
function source-bash-functions() {
  local FUNCTION
  for FUNCTION in "$XDG_CONFIG_HOME"/bash/init/functions/*.bash; do
    source "$FUNCTION"
  done
} && source-bash-functions

# Source local Bash functions.
#
# Use a function so that the environment variables that are used are not made
# available to the interactive shell.
function source-local-bash-functions() {
  # Check if any files match the glob before using it because using it would
  # raise an error if no files match.
  #
  # https://stackoverflow.com/a/6364244/715866
  if compgen -G "$XDG_CONFIG_HOME/bash/init/functions/local/*.bash" > /dev/null; then
    local FUNCTION
    for FUNCTION in "$XDG_CONFIG_HOME"/bash/init/functions/local/*.bash; do
      source "$FUNCTION"
    done
  fi
} && source-local-bash-functions
