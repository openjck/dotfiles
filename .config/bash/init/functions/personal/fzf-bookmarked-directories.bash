# Use fzf to chose a bookmarked directory.
function fzf-bookmarked-directories() {
  while IFS= read -r DIR; do
    echo "$DIR"
  done <<<"$(sorted-bookmarked-directories)" | fzf
}
