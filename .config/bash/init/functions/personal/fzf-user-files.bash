# Use fzf to chose any file in the user's home directory, at any depth.
function fzf-user-files() {
  fzf <<< "$(find "$HOME" -type f 2>/dev/null)"
}
