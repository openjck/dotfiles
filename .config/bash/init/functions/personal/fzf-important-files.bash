# Use fzf to choose a file of an important directory.
function fzf-important-files() {
  while IFS= read -r DIR; do
    fd . "$DIR"
  done <<< "$(sorted-important-directories)" | fzf
}
