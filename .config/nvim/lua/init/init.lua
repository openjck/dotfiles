require('init.mini')

-- Enable and configure plugins. This must be done before some things, like the
-- colorscheme, are set.
require('init.plugins')

-- Load general configurations.
require('init.appearance')
require('init.diff')
require('init.editing')
require('init.keys')
require('init.leader')
require('init.listchars')
require('init.spacing')
require('init.spelling')
require('init.wsl')

-- Source private, non-pushed, local configurations, if any.
--
-- To be found and used, the local configurations must exist in a file named
-- $XDG_CONFIG_HOME/nvim/lua/init/local/init.lua.
pcall(require, 'init.local')
