# TODO: This should probably be rewritten and published as a shell script.

# This works like "vcsh foreach" (e.g., "vcsh foreach ls-files"), except that it
# doesn't print a header for each repo like "vcsh foreach" does.
function vcsh-all() {
  for REPO in $(vcsh list); do
    vcsh "$REPO" "$@"
  done
}
