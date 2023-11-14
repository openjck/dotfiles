if exists('did_load_filetypes')
  finish
endif

augroup filetypedetect
  autocmd BufNewFile,BufRead .parcelrc set filetype=json
augroup END
