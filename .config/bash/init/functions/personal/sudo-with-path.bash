# Run sudo with the $PATH of the current user preserved.
#
# https://unix.stackexchange.com/a/83194
# https://askubuntu.com/a/22043
#
# This Stack Overflow answer explains in further detail why using --preserve-env
# doesn't work:
#
# https://unix.stackexchange.com/a/442755
function sudo-with-path() {
  sudo env "PATH=$PATH" "$@"
}
