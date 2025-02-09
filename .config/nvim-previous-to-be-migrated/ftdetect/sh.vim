" Based on a published technique[1] and part B of the new-filetype
" documentation.[2] Part B seems to be the most appropriate guidance for this
" case, as we only want to do this if no filetype was detected earlier.
"
" [1] https://blog.afoolishmanifesto.com/posts/content-based-filetype-detection-in-vim/
" [2] Run ":help new-filetype" and scroll to part B.
function! s:HandlePossibleShellFile()
  if getline(1) =~# '^# shellcheck'

    " Part B of the new-filetype documentation recommends using "setfiletype"
    " rather than "set filetype" here.
    setfiletype sh
  endif
endfunction

" Note that part B of the new-filetype documentation, in referring to part A,
" seems to suggest that a filetypedetect augroup should not be used here.
"
" vint: next-line -ProhibitAutocmdWithNoGroup
autocmd BufNewFile,BufRead * call s:HandlePossibleShellFile()
