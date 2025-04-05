-- The mini.nvim project offers a fuzzy finder (mini.fuzzy) and picker
-- (mini.pick) which together appear to be capable of solving the same problems
-- telescope does. It may even be possible to create a custom picker for my
-- dotfiles, as I do with telescope. However, I prefer the way telescope
-- appears, especially its multi-pane interface, I love all the much more
-- comprehensive set of pickers it provides (run :Telescope to see them), and
-- it's just more fun! I had been wanting to use telescope for a while.
MiniDeps.add({
  source = 'nvim-telescope/telescope.nvim',
  checkout = '0.1.x',
  depends = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  hooks = {
    post_checkout = function()
      vim.cmd('TSInstall lua')
    end
  },
})
