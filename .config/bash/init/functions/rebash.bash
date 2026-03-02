# This cannot be a shell script because shell scripts are executed in subshells
# and therefore cannot cause the parent shell (the shell that called the shell
# script) to be reload its configuration.

function rebash() {
  source "$HOME/.bashrc"
}
