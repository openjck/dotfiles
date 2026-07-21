function eza() {
  command eza \
    --all \
    --git \
    --group \
    --group-directories-first \
    --header \
    --hyperlink \
    --long \
    --octal-permissions \
    --time-style=long-iso \
    "$@"
}
