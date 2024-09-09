Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-repeat'
Plug 'mkitt/tabline.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'psliwka/vim-smoothie'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'openjck/vim-yadm-files'
Plug 'tpope/vim-fugitive'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-abolish'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'jremmen/vim-ripgrep'
Plug 'machakann/vim-sandwich'

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
