" Guard against being included multiple times.
if exists('_SOURCED_BOOLEANS') | finish | else | let _SOURCED_BOOLEANS = 1 | endif

" Add booleans, which Vimscript does not provide by default.
"
" https://devhints.io/vimscript#truthiness
let false = 0
let true = 1
