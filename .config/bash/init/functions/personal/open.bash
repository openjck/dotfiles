function open() {
  local TARGET="${1:-$(pwd)}"

  # When using WSL, prefer opening the target in Windows rather than Linux. This
  # is especially helpful when the thing being opened is a link because it opens
  # more quickly in a running Windows browser.
  if __in_wsl; then
    explorer.exe "$TARGET"
  elif __command_exists xdg-open; then
    xdg-open "$TARGET"
  else
    # macOS uses "open" to open files and directories.
    #
    # "open" is also the most appropriate fallback for everything else, since
    # this function may be shadowing an existing command named "open".
    command open "$TARGET"
  fi
}
