# This cannot be a shell script because shell scripts cannot easily shadow other
# commands.

function ls() {
  command ls --color=auto --group-directories-first --human-readable "$@"
}
