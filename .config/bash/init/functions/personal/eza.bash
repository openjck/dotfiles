function eza() {
  command eza \
    --all \
    --git \
    --group \
    --group-directories-first \
    --header \
    --long \
    --octal-permissions \
    --time-style=long-iso \
    "$@"
}
