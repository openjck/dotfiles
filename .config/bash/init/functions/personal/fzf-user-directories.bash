function fzf-user-directories() {
  fzf <<< "$(find "$HOME" -type d 2>/dev/null)"
}
