" Show only recent files.
"
" I don't see a use for the other optional sections at this time.
let g:startify_lists = [
  \ { 'type': 'files', 'header': ['   Recent files'] },
\ ]

" Don't show a header, which, by default, is cowsay with a random quote.
let g:startify_custom_header = v:null
