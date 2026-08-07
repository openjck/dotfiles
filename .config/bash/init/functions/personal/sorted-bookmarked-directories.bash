# Print $BOOKMARKED_DIRECTORIES, one entry on each line, sorted alphabetically.
function sorted-bookmarked-directories() {
  {
    for BOOKMARKED_DIRECTORY in "${BOOKMARKED_DIRECTORIES[@]}"; do
      echo "$BOOKMARKED_DIRECTORY"
    done
  } | sort --unique
}
