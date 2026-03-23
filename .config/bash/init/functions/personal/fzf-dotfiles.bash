function fzf-dotfiles() {
  # Use the "end" tiebreaker because it helps fzf match the desired result much
  # more consistently when one knows the exact name of the file they are
  # searching for, even if they don't know or don't want to type the path
  # leading up to it. When I'm using "fzf-dotfiles", I _do_ almost always know
  # the exact name of the file I want, even though I don't want to type the
  # whole path leading up to it.
  #
  # Note that this doesn't affect the "<Leader>fd" command in Neovim, since that
  # uses Telescope, not fzf.
  vcsh-list-files | fzf --tiebreak=end
}
