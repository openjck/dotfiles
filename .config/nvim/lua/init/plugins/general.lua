local add = MiniDeps.add

-- The mini.nvim project offers a fuzzy finder (mini.fuzzy) and picker
-- (mini.pick) which together appear to be capable of solving the same problems
-- telescope does. It may even be possible to create a custom picker for my
-- dotfiles, as I do with telescope. However, I prefer the way telescope
-- appears, especially its multi-pane interface, I love all the much more
-- comprehensive set of pickers it provides (run :Telescope to see them), and
-- it's just more fun! I had been wanting to use telescope for a while.
add({
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
add({
  source = 'dense-analysis/ale',
})

add({
  source = 'christoomey/vim-tmux-navigator',
})

add({
  source = 'jremmen/vim-ripgrep',
})

add({
  source = 'micarmst/vim-spellsync',
})

-- This plugin is archived, but it's pretty simple, and it may never need to be
-- updated. If a non-archived alternative is ever needed, tabulous is one option
-- that works similarly and is maintained as of the time of this writing.
--
-- https://github.com/webdevel/tabulous
add({
  source = 'mkitt/tabline.vim',
})

add({
  source = 'alvan/vim-closetag'
})

-- When Neovim < 0.10 is being used, the neogit release tagged v0.0.1 must also
-- be used. It's old, but not as old as it might sound. It was last updated in
-- May 2024.
add({
  source = 'NeogitOrg/neogit',
  checkout = 'v0.0.1',
  depends = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
})
