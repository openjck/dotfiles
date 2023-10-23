# shellcheck shell=sh

# Return true if a command exists, false otherwise.
#
# Note that if this were a shell script, it would execute in a subshell and
# would therefore return false for any functions that were configured for the
# shell or loaded later, like cdv or _completion_loader.
__command_exists() {
  COMMAND=$1
  command -v "$COMMAND" > /dev/null
}
