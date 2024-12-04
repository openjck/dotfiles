" Create an augroup named "init" which autocmds can be registered to later.
" Immediately clear out any autocmds registered to it in case this file is
" sourced more than once.
"
" vint raises a warning if this is not done.
augroup init
  autocmd!
augroup end

" Source all utilities so that they can be used in this file and files that are
" sourced from this file.
for file in globpath(expand('<sfile>:h'), 'utils/*.vim', 0, 1)
  execute 'source' file
endfor

" Enable and configure plugins. This must be done before some things, like the
" colorscheme, are set.
source <sfile>:h/init/plugins.vim

" Load general configurations.
source <sfile>:h/init/appearance.vim
source <sfile>:h/init/commands.vim
source <sfile>:h/init/diff.vim
source <sfile>:h/init/editing.vim
source <sfile>:h/init/keys.vim
source <sfile>:h/init/leader.vim
source <sfile>:h/init/listchars.vim
source <sfile>:h/init/projects.vim
source <sfile>:h/init/spacing.vim
source <sfile>:h/init/spelling.vim
source <sfile>:h/init/wsl.vim

" Source private, non-pushed, local configurations, if any.
if filereadable(expand('<sfile>:h') . '/init.local.vim')
  source <sfile>:h/init.local.vim
endif
