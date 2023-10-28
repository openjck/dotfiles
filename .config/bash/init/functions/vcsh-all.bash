function vcsh-all() {
  for REPO in $(vcsh list); do
    vcsh "$REPO" "$@"
  done
}

__reuse-completions vcsh vcsh-all
