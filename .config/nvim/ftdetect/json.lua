vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  pattern = '.parcelrc',
  callback = function()
    vim.bo.filetype = 'json'
  end,
})
