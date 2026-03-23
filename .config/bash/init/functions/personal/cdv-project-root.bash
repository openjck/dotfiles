function cdv-project-root() {
  local PROJECT_ROOT
  PROJECT_ROOT=$(project-root)

  if [[ -n $PROJECT_ROOT ]]; then
    cdv "$PROJECT_ROOT"
  else
    return 1
  fi
}
