-- Highlight matches.
vim.g.rg_highlight = true

-- Search hidden files.
--
-- It would be better to append to g:rg_command so that I could more reliably
-- preserve its options, but g:rg_command isn't set at this point for reasons I
-- don't understand. The vim-ripgrep/plugin/vim-ripgrep.vim file must be executed
-- after this file.
vim.g.rg_command = 'rg --vimgrep --hidden'

-- Search from the project root directory.
vim.g.rg_derive_root = true

-- Consider a directory with a .hg subdirectory a project root directory.
--
-- As above, it would be better to append to this array, but g:rg_root_types
-- isn't set at this point.
vim.g.rg_root_types = {
  '.hg',
  '.git',
}
