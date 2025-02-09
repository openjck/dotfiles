-- mini.nvim does offer a fuzzy finder plugin,[1] but I don't believe it's
-- possible to use it to create a fuzzy finder with a custom source. With
-- telescope, I create a custom fuzzy finder fot dotfiles.
--
-- Plus, I've always wanted to use telescope.
--
-- [1] https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-fuzzy.md
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

-- I considered using newer projects like nvim-lint[1] and conform,[2] but as
-- of the time of this writing (2025-02-08), nvim-lint currently cannot easily
-- use a copy of ESLint that exists in node_modules. That's important, because
-- different projects often use differnt versions of ESLint.
--
-- ale is also a more mature project, and I've enjoyed working with it. It does
-- ship with its own Language Server client, which is not needed in Neovim
-- since Neovim ships its own, but ale's can be disabled.
--
-- [1] https://github.com/mfussenegger/nvim-lint
-- [2] https://github.com/stevearc/conform.nvim
MiniDeps.add({
  source = 'dense-analysis/ale'
})

MiniDeps.add({
  source = 'christoomey/vim-tmux-navigator'
})
