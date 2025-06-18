MiniDeps.add('rcarriga/nvim-notify')

require('notify').setup({
    render = 'simple',
    stages = 'fade',
})

-- Use nvim-notify for all notifications.
--
-- https://github.com/rcarriga/nvim-notify?tab=readme-ov-file#usage
vim.notify = require('notify')
