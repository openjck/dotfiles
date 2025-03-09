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
