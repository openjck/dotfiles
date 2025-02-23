-- Work around the following bug in vim-polyglot, which causes ALE to treat
-- files with the "bash" file extension as POSIX shell scripts.
--
-- https://github.com/sheerun/vim-polyglot/issues/823

extension = vim.fn.expand('%:e')

if string.lower(extension) == 'bash' then
  vim.b.is_bash = true
end
