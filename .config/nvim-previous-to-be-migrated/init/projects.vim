" Set project-specific configurations.
"
" For example, configure indentation a certain way for files in a certain
" directory.
"
" Many articles recommend using "set exrc" to achieve this, but it's deprecated
" in Neovim due to security concerns. See ":help deprecated" for more
" information.

" Source private, non-pushed, local configurations, if any.
if filereadable(expand('<sfile>:h') . '/projects.local.vim')
  source <sfile>:h/projects.local.vim
endif
