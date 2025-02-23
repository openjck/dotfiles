" mini.nvim apparently has some similar functionality in mini.operators. I don't
" know how it stacks up against this plugin, although I don't use this plugin
" often, anyway.
Plug 'vim-scripts/ReplaceWithRegister'

" mini.nvim has an alternative called mini.bracketed. The mappings are a bit
" different, but it's probably good enough.
Plug 'tpope/vim-unimpaired'

" This plugin automatically saves folds when a file is closed and restores them
" when the file is opened again. It saves and restores some other stuff, too,
" like cursor position, as well as anything else specified in viewoptions, but I
" don't care about those, and that's not why I use it.
Plug 'vim-scripts/restore_view.vim'
