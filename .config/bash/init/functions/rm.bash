# This cannot be a shell script because shell scripts cannot easily shadow other
# commands.

function rm() {
  command rm --preserve-root "$@"
}
