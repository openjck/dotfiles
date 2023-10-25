" Do not open diffs in read-only mode.
"
" I suspect this is wiser than configuring Git to modify the command that it
" runs when opening Neovim in diff mode, as the command is fairly complex and I
" don't want to maintain my own version of it.
"
" https://newbedev.com/how-to-prevent-git-vimdiff-from-opening-files-as-read-only
if &diff
  set noreadonly
endif
