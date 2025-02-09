" Highlight the column whose position is 1 greater than the value of
" "textwidth".
"
" The "colorcolumn" option accepts a value prepended with + or -, which is then
" added to or subtracted from the value of "textwidth".
set colorcolumn=+1

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
