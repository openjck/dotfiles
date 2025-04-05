require('openjck.init.mini')

-- Enable and configure plugins. This must be done before some things, like the
-- colorscheme, are set.
require('openjck.init.plugins')

-- Load general configurations.
require('openjck.init.appearance')
require('openjck.init.autocmds')
require('openjck.init.commands')
require('openjck.init.diff')
require('openjck.init.editing')
require('openjck.init.keys')
require('openjck.init.leader')
require('openjck.init.listchars')
require('openjck.init.mouse')
require('openjck.init.spacing')
require('openjck.init.spelling')
require('openjck.init.wsl')

-- Source private, non-pushed, local configurations, if any.
--
-- To be found and used, the local configurations must exist in a file with
-- either of the following names:
--
--   - $XDG_CONFIG_HOME/nvim/lua/openjck/init/local.lua
--   - $XDG_CONFIG_HOME/nvim/lua/openjck/init/local/init.lua
pcall(require, 'openjck.init.local')
