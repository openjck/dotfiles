function eza() {
  command eza \
    --git \
    --group \
    --group-directories-first \
    --header \
    --octal-permissions \
    --time-style=long-iso \
    "$@"
}
