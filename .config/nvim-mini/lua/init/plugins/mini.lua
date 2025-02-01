enabled_plugins = {
  'ai',
  'align',
  'animate',
  'basics',
  'clue',
  'comment',
  'deps',
  'notify',
  'pairs',
  'starter',
  'surround',
}

for _, plugin in ipairs(enabled_plugins) do
  require(string.format('mini.%s', plugin)).setup()
end
