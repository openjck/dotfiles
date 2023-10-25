let g:deoplete#enable_at_startup = 1

" Enable only certain deoplete sources.
"
" See the documentation for deoplete-options-sources, deoplete-sources, and
" deoplete-external-sources for more information.
call deoplete#custom#option('sources', {
\ '_': [
\   'ale',
\   'ultisnips',
\   'file',
\ ],
\})

" If a preview window is automatically opened during completion, automatically
" close it when completion is completed.
"
" Preview windows do not automatically open for everything, but they do
" automatically open, for example, in JavaScript files when beginning to type
" document.querySelector.
"
" This exact line is recommended in the FAQ of the deoplete documentation.
autocmd init CompleteDone * silent! pclose!
