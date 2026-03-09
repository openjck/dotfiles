# Print the path to the root of the project we are navigated within, or return 1
# if we are not navigated within a project.
#
# https://stackoverflow.com/a/957978/4297741
function project-root() {
  local PROJECT_ROOT
  PROJECT_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)

  if [[ -n $PROJECT_ROOT ]]; then
    echo "$PROJECT_ROOT"
  else
    return 1
  fi
}
