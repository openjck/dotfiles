function fzf-user-files() {
  fzf <<< "$(find "$HOME" -type f 2>/dev/null)"
}
