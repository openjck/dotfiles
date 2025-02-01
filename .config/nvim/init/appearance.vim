" Enable true colors if they're supported.
"
" https://deductivelabs.com/blog/tech/using-true-color-vim-tmux/
if has('termguicolors')
  set termguicolors
endif

" Show line numbers.
set number

" Do not soft-wrap text.
set nowrap

" Highlight the column whose position is 1 greater than the value of
" "textwidth".
"
" The "colorcolumn" option accepts a value prepended with + or -, which is then
" added to or subtracted from the value of "textwidth".
set colorcolumn=+1

" When creating a vertical split, open it to the right of the current one, not
" the left. When creating a horizontal split, open it below the current one, not
" above.
set splitright
set splitbelow

" Automatically equalize splits when the terminal window is resized. For
" example, if there is a 50/50 vertical split when the terminal window is small,
" it will still be a 50/50 vertical split if the terminal window is maximized.
"
" If the split is not 50/50, it will become 50/50 when the terminal window is
" resized. There's a plugin called vim-in-proportion which attempts to handle
" that case as well.
"
" https://vi.stackexchange.com/a/206/28836
autocmd init VimResized * wincmd =

" Highlight yanked content.
"
" This is similar to vim-highlightedyank, but vim-highlightedyank doesn't
" support Neovim and Neovim also doesn't need vim-highlightedyank because
" support is built in.
"
" https://github.com/machakann/vim-highlightedyank#if-you-are-using-neovim
"
" See `:help lua-highlight` for more information about how to enable and
" configure this.
autocmd TextYankPost * silent! lua vim.highlight.on_yank()
