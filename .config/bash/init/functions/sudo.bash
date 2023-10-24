# Preserve the path when using sudo. The extra space before the closing quote is
# important. It tells bash to preserve aliases.
#
# https://unix.stackexchange.com/a/83194
# https://askubuntu.com/a/22043
#
# This Stack Overflow answer explains in further detail why using --preserve-env
# doesn't work:
#
# https://unix.stackexchange.com/a/442755
function sudo() {
  command sudo env "PATH=$PATH" "$@"
}
