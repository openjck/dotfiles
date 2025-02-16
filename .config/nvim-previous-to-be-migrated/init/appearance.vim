" Automatically equalize splits when the terminal window is resized. For
" example, if there is a 50/50 vertical split when the terminal window is small,
" it will still be a 50/50 vertical split if the terminal window is maximized.
"
" If the split is not 50/50, it will become 50/50 when the terminal window is
" resized. There's a plugin called vim-in-proportion which attempts to handle
" that case more intelligently, but it's not something I feel I need right now.
"
" https://vi.stackexchange.com/a/206/28836
autocmd init VimResized * wincmd =
