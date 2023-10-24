function open() {
  # When using WSL, prefer opening the target in Windows rather than Linux. This
  # is especially helpful when the thing being opened is a link because it opens
  # more quickly in a running Windows browser.
  if __in_wsl; then
    explorer.exe "$@"
  elif __command_exists xdg-open; then
    xdg-open "$@"
  else
    command open "$@"
  fi
}
