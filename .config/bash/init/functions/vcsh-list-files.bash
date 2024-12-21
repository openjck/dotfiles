function vcsh-list-files() {
  vcsh-all ls-files "$HOME" | sort --unique
}
