-- This is based on a published technique[1] and part B of the new-filetype
-- documentation.[2] Part B seems to be the most appropriate guidance for this
-- case, as we only want to do this if no filetype was detected earlier.
--
-- Note that part B of the new-filetype documentation, in referring to part A,
-- seems to suggest that a filetypedetect augroup should not be used here.
--
-- [1] https://blog.afoolishmanifesto.com/posts/content-based-filetype-detection-in-vim/
-- [2] Run ":help new-filetype" and scroll to part B.
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
    callback = function()
      local first_line = vim.fn.getline(1)
      if first_line:find('^# shellcheck') then
        -- Part B of the new-filetype documentation recommends using
        -- "setfiletype" rather than "set filetype" here because setfiletype
        -- only sets a filetype if a filetype was not already set.
        vim.cmd('setfiletype sh')
      end
    end,
})
