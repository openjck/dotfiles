MiniDeps.add({
  source = 'nvim-telescope/telescope.nvim',
  checkout = '0.1.x',
  hooks = {
    post_checkout = function()
      vim.cmd('TSInstall lua')
    end
  },
  depends = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
})

MiniDeps.add({
  source = 'dense-analysis/ale'
})
