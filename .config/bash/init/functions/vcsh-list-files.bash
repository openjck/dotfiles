# TODO: This should probably be rewritten and published as a shell script.

function vcsh-list-files() {
  vcsh-all ls-files "$HOME" | sort --unique
}
