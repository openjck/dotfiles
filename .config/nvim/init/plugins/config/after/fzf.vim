" Open multiple files as if they were passed as arguments to Neovim, so that,
" for example, the :next and :previous commands can be used to navigate between
" them.
function! s:open_multiple_files(filenames)
  let l:escaped_filenames = []
  for filename in a:filenames
    call add(l:escaped_filenames, fnameescape(filename))
  endfor
  execute 'args ' . join(l:escaped_filenames, ' ')
endfunction

" Run fzf, configured with some default options and any provided options.
function! s:configured_fzf(extra_options)
  " Passing the --multi flag to fzf and using a custom function to handle
  " selections allows us to select and open multiple files using the tab key.
  let l:default_options = {
    \'sinklist': function('s:open_multiple_files'),
    \'options': '--multi',
  \}

  let l:combined_options = extend(copy(l:default_options), a:extra_options)

  call fzf#run(fzf#wrap(l:combined_options))
endfunction

" Run fzf on all tracked (--cached) and untracked (--other) files in the current
" Git repository, with the exception of files that are ignored
" (--exclude-standard).
"
" This could be extended to support other version control systems in the future.
function s:FZFProjectHelper()
  if trim(system('git rev-parse --is-inside-work-tree')) ==# 'true'
    call s:configured_fzf({'source': 'git ls-files --cached --other --exclude-standard $(git rev-parse --show-toplevel)'})
  else
    echo 'Error: Not a project'
  endif
endfunction

" Add a command for files in the home directory.
command! FZFHome call s:configured_fzf({'dir': '$HOME'})

" Add a command for files managed by vcsh.
"
" I'd like to use vcsh-all here rather than reimplementing it, but I'm not sure
" how to make it available to this Vim script.
command! FZFDotfiles call s:configured_fzf({'source': '{ for REPO in $(vcsh list); do vcsh "$REPO" ls-files $HOME; done; } | sort'})

" Add a command for files in the current project.
command! FZFProject call s:FZFProjectHelper()
