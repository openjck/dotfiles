-- Enable specific plugins provided by the mini.nvim project by calling their
-- setup() functions.

-- Strictly speaking, any plugin that is configured (see init.plugins.config)
-- does not need to be listed here. At the same time, calling setup() here
-- doesn't hurt, except perhaps by causing startup time to be longer by some
-- miniscule amount, and it ensures the plugin will remain enabled even if it is
-- not configured in the future.
enabled_plugins = {
  'ai',
  'align',
  'animate',
  'basics',
  'clue',
  'comment',
  'completion',
  'cursorword',
  'deps',
  'diff',
  'hipatterns',
  'indentscope',
  'move',
  'notify',
  'pairs',
  'starter',
  'surround',
}

for _, plugin in ipairs(enabled_plugins) do
  require(string.format('mini.%s', plugin)).setup()
end
