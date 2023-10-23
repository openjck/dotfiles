# shellcheck shell=sh

__source_if_file_exists() {
  FILENAME=$1
  if [ -f "$FILENAME" ]; then
    . "$FILENAME"
  fi
}
