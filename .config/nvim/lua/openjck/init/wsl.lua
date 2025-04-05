local path_in_wsl = os.getenv('XDG_CONFIG_HOME') .. '/sh/init/utils/__in_wsl.sh'
local result = os.execute(string.format('. %s && __in_wsl', path_in_wsl))

if result == 0 then
  -- Add support for opening links in the Windows host.
  --
  -- https://superuser.com/a/1317266/1174309
  vim.g.netrw_browsex_viewer = 'cmd.exe /C start'

  -- Paste into Neovim without the carriage return (CR) character that Windows
  -- uses alongside LF to mark line endings.
  vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
      ['+'] = 'clip.exe',
      ['*'] = 'clip.exe',
    },
    paste = {
      ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end
