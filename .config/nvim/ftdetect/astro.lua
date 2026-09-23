vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  pattern = '*.astro',
  callback = function()
    vim.bo.filetype = 'astro'
  end,
})
