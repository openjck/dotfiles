call system('source "$XDG_CONFIG_HOME/sh/utils/__in_wsl.sh" && __in_wsl')
if v:shell_error == 0
  " Add support for opening links.
  "
  " https://superuser.com/a/1317266/1174309
  let g:netrw_browsex_viewer='cmd.exe /C start'

  " Add support for copying from and pasting to the Windows system clipboard.
  " Note that win32yank.exe must be installed.
  "
  " https://superuser.com/a/1557751/1174309
  "
  " The Super User answer suggests setting "clipboard" to "unnamedplus", which
  " causes ALL copy/paste operations, even normal "y" and "p" operations, to use
  " the system clipboard. I dislike that.
  let g:clipboard = {
  \  'name': 'win32yank-wsl',
  \  'copy': {
  \     '+': 'win32yank.exe -i --crlf',
  \     '*': 'win32yank.exe -i --crlf',
  \   },
  \  'paste': {
  \    '+': 'win32yank.exe -o --lf',
  \    '*': 'win32yank.exe -o --lf',
  \  },
  \  'cache_enabled': 0,
  \ }
endif
