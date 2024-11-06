call system('source "$XDG_CONFIG_HOME/sh/init/utils/__in_wsl.sh" && __in_wsl')
if v:shell_error == 0
  " Add support for opening links in the Windows host.
  "
  " https://superuser.com/a/1317266/1174309
  let g:netrw_browsex_viewer='cmd.exe /C start'
endif
