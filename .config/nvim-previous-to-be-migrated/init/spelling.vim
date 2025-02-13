" Automatically generate binary files for personal dictionaries.
"
" Neovim maintains two files for each personal dictionary: a plaintext .add file
" and a binary .add.spl file. The first can be synchronized between computers
" but the second cannot. Therefore, we need to regenerate the second upon
" startup in case the first has changed.
"
" https://vi.stackexchange.com/a/5052
for d in glob('$XDG_CONFIG_HOME/nvim/spell/*.add', 1, 1)
  if filereadable(d) && (!filereadable(d . '.spl') || getftime(d) > getftime(d . '.spl'))
    silent exec 'mkspell! ' . fnameescape(d)
  endif
endfor
