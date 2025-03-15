MiniDeps.add('neovim/nvim-lspconfig')
MiniDeps.add('williamboman/mason.nvim')
MiniDeps.add('williamboman/mason-lspconfig.nvim')

-- This is a bit confusing, but it has the desired effect: I'm able to install
-- LSPs with mason, and they are automatically enabled for appropriate file
-- types. For example, I can install typescript-language-server with mason and
-- it will automatically be enabled when I open a TypeScript file. As a bonus,
-- if a TypeScript file is actively opened when I use mason to install
-- typescript-language-server, typescript-language-server will be enabled
-- immediately, even without me closing and reopening the file.
--
-- It might seem that installing the following plugins would be enough:
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
-- One could run those lines globally, in something like init.lua, or I suppose
-- one could set up autocmds to only run those lines for certain file types. For
-- example, one could set up an autocmd to only run those lines when
-- a TypeScript file is being edited.
--
-- That's why the setup handler is also used. It tells Neovim to _automatically_
-- enable LSPs for appropriate file types. I think that's the best approach for
-- now, but I can also understand why one might not want that. For example,
-- perhaps one wouldn't want Deno's language server to be enabled for any
-- JavaScript file, even if Deno's language server is installed. After all, not
-- all JavaScript files are being used with Deno. For me, for now, I'm not so
-- worried about that. If something like that were to happen, I could just
-- uninstall the offending LSP temporarily.
--
-- I believe my understanding is correct, anyway. I may have some of the
-- terminology or finer details wrong, but I believe this overview is generally
-- correct.
--
-- For more information, see ":help mason-lspconfig-automatic-server-setup".
--
-- Finally, it might be tempting to split this file into several smaller files,
-- but it's probably not worth it. Everything needs to happen in a very specific
-- order.

local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')

mason.setup()

mason_lspconfig.setup({
  -- Automatically install these language servers if they're not installed
  -- already.
  --
  -- I would also add the following to this list if I could, but for some
  -- reason, at the time of this writing, they do not have server names and
  -- therefore cannot be listed for automatic installation. Maybe they are not
  -- supported by one or more tools.
  --
  --   - prettierd
  ensure_installed = {
    'bashls',
    'eslint',
    'lua_ls',
    'ts_ls',
  },
})

-- Set up language servers automatically.
mason_lspconfig.setup_handlers({
  function (server_name)
    lspconfig[server_name].setup({})
  end,
})
