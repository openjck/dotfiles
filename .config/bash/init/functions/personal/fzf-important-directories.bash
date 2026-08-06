# Use fzf to chose one of the entries of $IMPORTANT_DIRECTORIES.
function fzf-important-directories() {
  while IFS= read -r DIR; do
    echo "$DIR"
  done <<< "$(sorted-important-directories)" | fzf
}
