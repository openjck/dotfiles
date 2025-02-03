# This works like "vcsh foreach" (e.g., "vcsh foreach ls-files"), except that it
# doesn't print a header for each repo like "vcsh foreach" does.
function vcsh-all() {
  for REPO in $(vcsh list); do
    vcsh "$REPO" "$@"
  done
}

# This function might be sourced in non-interactive environments, so we should
# only set up completions if the shell is interactive.
if [[ $- == *i* ]]; then
  __reuse-completions vcsh vcsh-all
fi
