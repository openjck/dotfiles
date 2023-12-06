" Use the spacebar as the leader key.
"
" Mapping `<Space>` to `<Nop>` before mapping `<Space>` to `<Leader>` ensures
" that the spacebar does not fall back to its default behavior when `timeoutlen`
" expires, assuming `timeout` is enabled.
"
" Note that `map` must be used in the second line, rather than `noremap`,
" otherwise the mapping would recurse, since we define other mappings in this
" file which use the leader.
"
" https://stackoverflow.com/questions/446269/can-i-use-space-as-mapleader-in-vim
nnoremap <Space> <Nop>
map <Space> <Leader>

" Always use `nore` mapping commands.[1] An exception to this rule is that
" mappings to `<Plug>` mappings should not use `nore` commands because they are
" themselves mappings that need to be looked up.
"
" I use `<Plug>` mappings as values whenever possible. I'm not completely
" convinced of the benefits of doing this, but it seems to be a best
" practice.[2]
"
" When `<Plug>` mappings are not used as values, using `<C-U>` after the colon
" seems to be a best practice as well.[3][4][5]
"
" [1] https://learnvimscriptthehardway.stevelosh.com/chapters/05.html#nonrecursive-mapping
" [2] https://www.reddit.com/r/vim/comments/bgf3zt/why_should_i_use_plug_in_my_mappings_instead_of/
" [3] https://dev.to/vintharas/5-minutes-vim-ctrlp-considered-harmful-48eg
" [4] https://stackoverflow.com/a/13831705/4297741
" [5] https://vi.stackexchange.com/a/9752/28836

""""""""""""""""""""""
" Edit (as in :edit) "
""""""""""""""""""""""

" Mnemonic: Edit next
nnoremap <Leader>en <Cmd>next<CR>

" Mnemonic: Edit previous
nnoremap <Leader>ep <Cmd>previous<CR>

"""""""""
" Files "
"""""""""

" Mnemonic: Files home
nnoremap <Leader>fh <Cmd>FZFHome<CR>

" Mnemonic: Files project
nnoremap <Leader>fp <Cmd>FZFProject<CR>

" Mnemonic: Files dotfiles
nnoremap <Leader>fd <Cmd>FZFDotfiles<CR>

"""""""""""""""""
" Go (movement) "
"""""""""""""""""

" Mnemonic: Go conflict next (for diff conflicts)
nnoremap <Leader>gcn /=======<CR>

" Mnemonic: Go conflict previous (for diff conflicts)
nnoremap <Leader>gcp ?=======<CR>

" Mnemonic: Go definition
nmap <Leader>gd <Plug>(ale_go_to_definition)

" Mnemonic: Go issue first
nmap <Leader>gif <Plug>(ale_first)

" Mnemonic: Go issue last
nmap <Leader>gil <Plug>(ale_last)

" Mnemonic: Go issue next
nmap <Leader>gin <Plug>(ale_next_wrap)

" Mnemonic: Go issue previous
nmap <Leader>gip <Plug>(ale_previous_wrap)

" Mnemonic: Go type
nmap <Leader>gt <Plug>(ale_go_to_type_definition)

""""""""
" Hide "
""""""""

" Turn off search highlights until a new search is done
"
" NOTE: Do not use ":set nohlsearch" here, as that would turn off highlighting
" even after a new search is done.
"
" Mnemonic: Hide highlights
nnoremap <Leader>hh <Cmd>nohlsearch<CR>

""""""""""""""""
" Modification "
""""""""""""""""

" Mnemonic: Modify inline
"
" This is supported in IdeaVim, but not in Neovim. In IntelliJ, it inlines a
" variable or function (i.e., replaces the variable/function with its
" value/implementation), but as far as I know, there is no analogue for this in
" ale.
nmap <Leader>mi <Cmd>echo "Not supported."<CR>

" Mnemonic: Modify fix
nmap <Leader>mf <Plug>(ale_fix)

" Mnemonic: Modify move
nnoremap <Leader>mm <Cmd>ALEFileRename<CR>

" Mnemonic: Modify rename
nnoremap <Leader>mr <Cmd>ALERename<CR>

" Mnemonic: Modify suggest
"
" This is supported in IdeaVim, but not in Neovim. In IntelliJ, it opens up a
" menu of suggested changes, but as far as I know, there is no analogue for this
" in ale.
nnoremap <Leader>ms <Cmd>echo "Not supported."<CR>

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

""""""""
" Show "
""""""""

" Mnemonic: Show documentation
nmap <Leader>sd <Plug>(ale_documentation)

" Mnemonic: Show hover
nmap <Leader>sh <Plug>(ale_hover)

" Mnemonic: Show message
nmap <Leader>sm <Plug>(ale_detail)

" Mnemonic: Show usages
nnoremap <Leader>su <Plug>(ale_find_references)

""""""""
" Test "
""""""""

" Mnemonic: Test
"
" This is supported in IdeaVim, but not in Neovim. In IntelliJ, if the cursor is
" located in a test method, it turns that method. If the cursor is located
" elsewhere, it runs all tests in the file. There does not appear to be a way to
" run all tests in a file if the cursor is located in a test method in IntelliJ.
nnoremap <Leader>t <Cmd>echo "Not supported."<CR>

"""""""""
" Utils "
"""""""""

" Mnemonic: Util undo
nnoremap <Leader>uu <Cmd>MundoToggle<CR>
