-- Disable key mappings in CSV files.
--
-- Among other things, this disables a mapping of the <Space> key that annoys
-- me because I use <Space> as my leader.
--
-- https://github.com/chrisbra/csv.vim#normal-mode-commands
-- https://github.com/chrisbra/csv.vim/issues/149
vim.g.no_csv_maps = true

-- Do not conceal, with a vertical bar, the real separator used in CSV files.
vim.g.csv_no_conceal = true
