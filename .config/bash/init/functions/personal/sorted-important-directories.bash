# Print $IMPORTANT_DIRECTORIES, one entry on each line, sorted alphabetically.
function sorted-important-directories() {
  {
    for IMPORTANT_DIRECTORY in "${IMPORTANT_DIRECTORIES[@]}"; do
      echo "$IMPORTANT_DIRECTORY"
    done
  } | sort --unique
}
