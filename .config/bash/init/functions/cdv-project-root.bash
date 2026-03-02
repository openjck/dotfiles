# This cannot be a shell script because shell scripts are executed in subshells
# and therefore cannot cause the parent shell (the shell that called the shell
# script) to navigate.

function cdv-project-root() {
  local PROJECT_ROOT
  PROJECT_ROOT=$(project-root)

  if [[ -n "$PROJECT_ROOT" ]]; then
    cdv "$PROJECT_ROOT"
  else
    >&2 echo "Error: Current directory is not in a project."
    return 1
  fi
}
