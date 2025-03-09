""""""""""""""""
" Modification "
""""""""""""""""

" Mnemonic: Modify inline
"
" This is supported in JetBrains IDEs, but not in Neovim. In JetBrains IDEs, it
" inlines a variable or function (i.e., replaces the variable/function with its
" value/implementation), but as far as I know, there is no analogue for this in
" ale.
"
" LSP doesn't appear to provide a way to do this, but this plugin claims to be
" able to do it:
"
" https://github.com/ThePrimeagen/refactoring.nvim
nmap <Leader>mi <Cmd>echo "Not supported."<CR>

" Mnemonic: Modify fix
nmap <Leader>mf <Plug>(ale_fix)

""""""""""
" Neovim "
""""""""""

" Mnemonic: Neovim reconfigure
nnoremap <Leader>nr <Cmd>Reconfigure<CR>

""""""""
" Open "
""""""""

" Mnemonic: Open scratch
"
" Note that this does not open a true scratch buffer. It's my understanding that
" scratch buffers in Neovim don't prompt for saving when they are closed,
" although I find the scratch buffer documentation to be confusing on this
" point. I'd prefer that my "scratch" buffer _does_ prompt for saving so that I
" don't accidentally lose anything important.
nnoremap <Leader>os <Cmd>vnew<CR>

"""""""""""
" Plugins "
"""""""""""

" NOTE: In the new profile, <Leader>p is used for pasting from the system
" clipboard, so I'd need to use another namespace for these if I keep them.
" Maybe <Leader>x for "extensions".

" "Reconfigure" must be run before vim-plug will pick up on any changes that can
" be acted upon.
"
" See this bug report, which was later closed, for more information.
"
" https://github.com/junegunn/vim-plug/issues/1168

" Mnemonic: Plugins install
nnoremap <Leader>pi <Cmd>Reconfigure <Bar> PlugInstall<CR>

" Mnemonic: Plugins clean
nnoremap <Leader>pc <Cmd>Reconfigure <Bar> PlugClean!<CR>

"""""""""
" Utils "
"""""""""

" Mnemonic: Util undo
nnoremap <Leader>uu <Cmd>MundoToggle<CR>
