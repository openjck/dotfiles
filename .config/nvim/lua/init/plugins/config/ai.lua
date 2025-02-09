local ai = require('mini.ai')

ai.setup({
  custom_textobjects = {

    -- Add a custom textobject for the entire buffer. The choice of "e" is
    -- inspired by vim-textobj-entire.
    --
    -- https://github.com/kana/vim-textobj-entire
    --
    -- This text object is taken straight from an example in the mini.ai
    -- documentation (:help mini.ai).
    e = function()
      local from = {
        line = 1,
        col = 1,
      }

      local to = {
        line = vim.fn.line('$'),
        col = math.max(vim.fn.getline('$'):len(), 1)
      }

      return {
        from = from,
        to = to
      }
    end
  }

})
