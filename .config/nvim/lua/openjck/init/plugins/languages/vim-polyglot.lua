-- Unlike most other plugins, vim-polyglot must be configured before it is
-- enabled.
vim.g.polyglot_disabled = {
  -- Do not set indentation settings based on the indentation of the current
  -- file or the indentation of neighboring files.
  --
  -- I find this to be very weird. When I first encountered this behavior, it
  -- took me a while to figure out what was going on.
  'autoindent',
}

-- vim-polyglot describes itself as a language pack. It MiniDeps.adds plugins
-- for languages that are not supported by Neovim out of the box, as well as
-- plugins that improve support for others.
--
-- The plugins vim-polyglot pulls in can sometimes be too clever, changing the
-- appearance or behavior of Neovim in ways I find annoying. Configuration may
-- be necessary in those cases.
MiniDeps.add('sheerun/vim-polyglot')

-- Disable key mappings in CSV files.
--
-- Among other things, this disables a mapping of the <Space> key that annoys
-- me because I use <Space> as my leader.
--
-- https://github.com/chrisbra/csv.vim#normal-mode-commands
-- https://github.com/chrisbra/csv.vim/issues/149
--
-- csv.vim, which is being configured here, is not installed directly, but
-- rather indirectly through vim-polyglot. 
vim.g.no_csv_maps = true

-- Do not conceal, with a vertical bar, the real separator used in CSV files.
--
-- csv.vim, which is being configured here, is not installed directly, but
-- rather indirectly through vim-polyglot. 
vim.g.csv_no_conceal = true
