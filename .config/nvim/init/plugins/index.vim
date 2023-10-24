let s:this_directory = expand('<sfile>:h')

" Source configuration files that must be loaded before plugins are enabled.
for file in globpath(s:this_directory, 'config/before/*.vim', 0, 1)
  execute 'source' file
endfor

" Enable plugins.
call plug#begin()
  source <sfile>:h/colors.vim
  source <sfile>:h/general.vim
  source <sfile>:h/languages.vim
call plug#end()

" Source configuration files that can or must be loaded after plugins are
" enabled.
for file in globpath(s:this_directory, 'config/after/*.vim', 0, 1)
  execute 'source' file
endfor
