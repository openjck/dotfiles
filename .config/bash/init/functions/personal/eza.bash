function eza() {
  command eza \
    --git \
    --group \
    --group-directories-first \
    --header \
    --hyperlink \
    --octal-permissions \
    --time-style=long-iso \
    "$@"
}
