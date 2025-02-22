-- According to the mason-lspconfig documentation, it's important that mason is
-- set up first, then mason-lspconfig, then nvim-lspconfig.
--
-- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#setup
require('init.plugins.lsp.mason')
require('init.plugins.lsp.mason-lspconfig')
require('init.plugins.lsp.nvim-lspconfig')
