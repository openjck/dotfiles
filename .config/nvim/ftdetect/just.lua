-- just supports files named _.justfile_, but Neovim does not apply the "just"
-- filetype to them as of 0.11.6.
--
-- https://github.com/casey/just?tab=readme-ov-file#hiding-justfiles
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  pattern = '.justfile',
  callback = function()
    vim.bo.filetype = 'just'
  end,
})
