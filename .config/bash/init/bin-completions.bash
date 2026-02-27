# Enable completion of scripts I've written.
function source-bin-completions() {
  local COMPLETION_FILE
  for COMPLETION_FILE in "$HOME/bin/general/completions"/*; do
    source "$COMPLETION_FILE"
  done
} && source-bin-completions
