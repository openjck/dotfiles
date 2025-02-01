Plug 'dense-analysis/ale'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mkitt/tabline.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'openjck/vim-yadm-files'
Plug 'tpope/vim-fugitive'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-abolish'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'jremmen/vim-ripgrep'
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

" vim-textobj-entire depends on vim-textobj-user.
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
