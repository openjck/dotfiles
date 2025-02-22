MiniDeps.add({
  source = 'NeogitOrg/neogit',
  depends = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
})

require('neogit').setup()
