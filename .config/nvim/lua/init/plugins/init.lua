-- Source configuration files that must be loaded before plugins are enabled.
--
-- The configuration options of some plugins, like vim-polyglot, must be set
-- before their corresponding plugins are enabled.
require('init.plugins.config.before')

-- Enable plugins from the mini.nvim project.
--
-- Plugins from the mini.nvim project must be enabled before others are
-- installed because mini.deps is among them and mini.deps is used to install
-- all other plugins.
require('init.plugins.setup.mini')

-- Install and/or enable all other plugins.
require('init.plugins.colors')
require('init.plugins.general')
require('init.plugins.languages')

-- Apply any additional setup that other, non-mini plugins may need.
require('init.plugins.setup.general')

-- Source configuration files that can or must be loaded after plugins are
-- enabled.
require('init.plugins.config.after')
