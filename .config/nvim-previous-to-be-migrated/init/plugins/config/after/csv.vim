" Disable key mappings.
"
" Among other things, this disables a mapping of the <Space> key that annoys me
" because I use <Space> as my leader.
"
" https://github.com/chrisbra/csv.vim#normal-mode-commands
" https://github.com/chrisbra/csv.vim/issues/149
let g:no_csv_maps = 1

" Do not conceal the real separator used in the file with a vertical bar.
let g:csv_no_conceal = 1
