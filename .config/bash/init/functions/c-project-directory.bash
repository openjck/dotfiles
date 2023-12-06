function c-project-directory() {
  local PROJECT_ROOT
  PROJECT_ROOT=$(project-root)

  if [[ -n "$PROJECT_ROOT" ]]; then
    local DESTINATION
    DESTINATION=$(find "$PROJECT_ROOT" -type d | fzf)

    # Attempt to navigate only if a different directory was successfully chosen
    # in fzf. Importantly, this handles the case where the user quits fzf with
    # CTRL-C (DESTINATION will be empty) or hits enter without entering a search
    # term (DESTINATION will be equal to '.').
    if [[ -n "$DESTINATION" && "$DESTINATION" != '.' ]]; then
      cdv "$DESTINATION"
    fi
  else
    >&2 echo "Error: Current directory is not a project."
    return 1
  fi
}
