function c-project-root() {
  local PROJECT_ROOT
  PROJECT_ROOT=$(project-root)

  if [[ -n "$PROJECT_ROOT" ]]; then
    cdv "$PROJECT_ROOT"
  else
    >&2 echo "Error: Not a project"
  fi
}
