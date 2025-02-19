-- Source configuration files that must be loaded before plugins are enabled.
--
-- The configuration options of some plugins, like vim-polyglot, must be set
-- before their corresponding plugins are enabled.
require('init.plugins.config.before')

-- Install plugins from the mini.nvim project.
--
-- Plugins from the mini.nvim project must be installed before others because
-- mini.deps is among them and mini.deps is used to install all other plugins.
require('init.plugins.mini')

-- Install all other plugins.
require('init.plugins.colors')
require('init.plugins.general')
require('init.plugins.languages')

-- Apply any additional setup a plugin may need.
require('init.plugins.setup')

-- Source configuration files that can or must be loaded after plugins are
-- enabled.
require('init.plugins.config.after')
