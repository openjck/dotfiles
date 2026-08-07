# Use fzf to chose any subdirectory of the user's home directory.
function fzf-user-directories() {
  fzf <<< "$(find "$HOME" -type d 2>/dev/null)"
}
