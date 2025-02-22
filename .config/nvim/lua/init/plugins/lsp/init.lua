MiniDeps.add('williamboman/mason.nvim')
MiniDeps.add('williamboman/mason-lspconfig.nvim')
MiniDeps.add('neovim/nvim-lspconfig')

-- This can be somewhat confusing, but it has the desired effect: I'm able to
-- install LSPs with mason, and they are automatically enabled in appropriate
-- file types. For example, I can install typescript-language-server with mason
-- and it will automatically be enabled when opening a TypeScript file. As
-- a bonus, if a TypeScript file is opened when mason installs
-- typescript-language-server, I won't even need to close and reopen the file
-- for the LSP to be enabled.
--
-- It might seem that it would be enough to install and enable the following
-- plugins:
--
--   - mason (a tool for installing LSPs)
--   - nvim-lspconfig (configuration files that tell Neovim how to use specific
--     LSPs, like typescript-language-server)
--   - mason-lspconfig (a plugin that bridges the gap between the previous two)
--
-- However, that's not enough. Even then, one would need to enable specific LSPs
-- in their Neovim configuration by adding lines like these:
--
--   -- Enable typescript-language-server.
--   require("lspconfig").ts_ls.setup()
--
-- They could use lines like that globally, in something like init.lua, or
-- I suppose they could set up autocmds to only run lines like those for certain
-- file types. For example, they could set up an autocmd to only run the above
-- lines in TypeScript files.
--
-- That's why the setup handler is needed. It tells Neovim to _automatically_
-- enable LSPs for appropriate file types. It's as if it's saying, "Hey, we're
-- in a TypeScript file? Great! Run those lines to enable
-- typescript-language-server."
--
-- For more information, see ":h mason-lspconfig-automatic-server-setup".

local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')

mason.setup()
mason_lspconfig.setup()

mason_lspconfig.setup_handlers {
  function (server_name)
    lspconfig[server_name].setup {}
  end,
}
