# This cannot be a shell script because shell scripts are executed in subshells
# and therefore cannot cause the parent shell (the shell that called the shell
# script) to reload its configuration.

function reprofile() {
  source "$HOME/.profile"
}
