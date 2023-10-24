# Print the path to the root of the project we are navigated within, or return 1
# if we are not navigated within a project.
#
# This would not work properly if it were a shell script. Shell scripts are
# executed in subshells, where "cd" does not affect the shell that called the
# script.
#
# https://stackoverflow.com/a/957978/4297741
function project-root() {
  local PROJECT_ROOT
  PROJECT_ROOT=$(git rev-parse --show-toplevel 2> /dev/null)

  if [[ -n "$PROJECT_ROOT" ]]; then
    echo "$PROJECT_ROOT"
  else
    return 1
  fi
}
