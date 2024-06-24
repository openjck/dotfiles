function zellij() {
  if command zellij list-sessions | grep --quiet main; then
    command zellij attach main
  else
    command zellij --session main "$@"
  fi
}
