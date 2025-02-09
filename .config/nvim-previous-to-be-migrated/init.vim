" Source private, non-pushed, local configurations, if any.
if filereadable(expand('<sfile>:h') . '/init.local.vim')
  source <sfile>:h/init.local.vim
endif
