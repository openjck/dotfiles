-- These autocmds use the LSP to highlight the symbol under the cursor. They
-- come straight from Neovim's LSP documentation, except they were converted to
-- Lua with the help of ChatGPT.
--
-- ChatGPT actually recommended passing "buffer = 0" in the option table (the
-- second argument), but when I do that, it doesn't work for reasons I don't
-- understand. In fact, using the exact Vimscript autocmds directly from the LSP
-- documentation with "vim.cmd()" also doesn't work. Who knows.

vim.api.nvim_create_autocmd({'CursorHold', 'CursorHoldI'}, {
  callback = vim.lsp.buf.document_highlight,
})

vim.api.nvim_create_autocmd('CursorMoved', {
  callback = vim.lsp.buf.clear_references,
})
