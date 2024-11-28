function n() {
  echo 'Using helix...'
  sleep 1
  hx "$@"
}

__reuse-completions nvim n
