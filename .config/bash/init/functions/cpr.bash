# This cannot be a shell script because shell scripts are executed in subshells
# and therefore cannot cause the parent shell (the shell that called the shell
# script) to navigate.

function cpr() {
  cdv-project-root
}
