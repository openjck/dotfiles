Plug 'mkitt/tabline.vim'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-abolish'

" mini.nvim apparently has some similar functionality in mini.operators. I don't
" know how it stacks up against this plugin, although I don't use this plugin
" often, anyway.
Plug 'vim-scripts/ReplaceWithRegister'

Plug 'tpope/vim-unimpaired'

" This plugin automatically saves folds when a file is closed and restores them
" when the file is opened again. It saves and restores some other stuff, too,
" like cursor position, as well as anything else specified in viewoptions, but I
" don't care about those, and that's not why I use it.
Plug 'vim-scripts/restore_view.vim'

" This plugin allows one to open the output of an ex-command in a new buffer.
" This makes it possible to, for example, search the output of the ex-command.
"
" Use it like this:
"
"  :Capture ALEInfo
"
" See ":help capture" or the following Stack Exchange answer for more
" information:
"
" https://vi.stackexchange.com/a/10472/28836
Plug 'AmaiSaeta/capture.vim'
