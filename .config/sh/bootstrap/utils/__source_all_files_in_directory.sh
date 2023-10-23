# shellcheck shell=sh

__source_all_files_in_directory() {
  DIRECTORY=$1

  for FILE in "$DIRECTORY"/*; do
    . "$FILE"
  done
}
