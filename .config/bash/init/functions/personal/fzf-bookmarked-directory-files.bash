# Use fzf to choose any file of a bookmarked directory.
function fzf-bookmarked-directory-files() {
  while IFS= read -r DIR; do
    fd . "$DIR"
  done <<< "$(sorted-important-directories)" | fzf
}
