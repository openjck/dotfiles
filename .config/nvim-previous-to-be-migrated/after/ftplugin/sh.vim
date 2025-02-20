" Automatically insert comment leaders when performing certain kinds of edits to
" existing comments.
"
" This makes comment editing behave more like it does in other file types. I
" don't know why this isn't enabled by default.
set formatoptions+=cro

" Work around the following bug in vim-polyglot, which causes ALE to treat files
" with the "bash" file extension as POSIX shell scripts.
"
" https://github.com/sheerun/vim-polyglot/issues/823
if expand('%:e') ==? 'bash'
  let b:is_bash = 1
endif

" Note to self: Yes, this is still needed. In the current Neovim profile,
" opening a Bash function (e.g., neovim-git.bash) causes it to be treated like
" a POSIX sh file.
