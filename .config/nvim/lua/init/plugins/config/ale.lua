-- Always show the sign column, even when no linters are enabled.
--
-- ALE shows the sign column when any linters are enabled, so this helps the UI
-- to appear consistent even when no linters are enabled.
--
-- ALE does have a similar option called ale_sign_column_always, but even
-- when it's enabled, a sign column is only shown if there are linters enabled
-- for the open buffer.
--
-- mini.basics already sets "signcolumn" to "yes", but I'd like to do so here
-- as well, just in case I ever stop using mini.basics.
vim.o.signcolumn = 'yes'

-- Use different symbols for warnings and errors.
vim.g.ale_sign_warning = '!'
vim.g.ale_sign_error = 'X'

-- Do not show issues as virtual text. Virtual text is non-editable text that
-- appears in the buffer.
vim.g.ale_virtualtext_cursor = 'disabled'

-- Explicitly enable fixers.
--
-- I don't think the documentation is very clear about this, but it appears
-- that none are enabled by default.
vim.g.ale_fixers = {
  css = {
    'prettier',
  },
  haskell = {
    'ormolu',
  },
  html = {
    'prettier',
  },
  javascript = {
    'eslint',
    'prettier',
  },
  javascriptreact = {
    'eslint',
    'prettier',
  },
  markdown = {
    'prettier',
  },
  typescript = {
    'eslint',
    'prettier',
  },
  typescriptreact = {
    'eslint',
    'prettier',
  },
  yaml = {
    'prettier',
  },
}

-- Modify the list of enabled linters for certain filetypes.
--
-- Any filetypes specified below will have only the specified linters enabled.
-- Any filetype that is not specified below will have ALE's default linters
-- enabled. The `g:ale_linters_explicit` option could alternatively be enabled
-- to ensure that only linters that are specified below are enabled. That is,
-- any filetype that is not specified would not have any linters enabled.
--
-- Enable only ESLint and tsserver (a JavaScript and TypeScript language
-- server) as linters for JavaScript/JSX and TypeScript/TSX projects. Note
-- that, in its default configuration, ALE uses the specified JavaScript
-- linters for _javascriptreact_ filetypes and the specified TypeScript linters
-- for _typescriptreact_ filetypes, so we don't need to also configure those.
-- See `:help ale_linter_aliases` for more information.
--
-- Note that this also disables the Deno linter. The Deno linter often reports
-- irrelevant issues when not working in a Deno project. I would prefer to
-- enable the Deno linter for Deno projects and disable it for non-Deno
-- projects, but I don't know of a good way to do that at the time of this
-- writing. I mostly work on non-Deno projects, so I'm comfortable disabling it
-- entirely for now.
vim.g.ale_linters = {
  javascript = {
    'eslint',
    'tsserver',
  },
  typescript = {
    'eslint',
    'tsserver',
  },
}

-- Disable linting on files with names like the following:
--
--   .env
--   .env.dist
--   .env-dist
--
-- Note that the dot before the term "dist" is a regex dot, not a literal dot.
-- Note also that the \v escape sequence at the beginning of the pattern makes
-- the regex more human-readable. See ":help ale_pattern_options" and the
-- following article.
--
-- https://vim.fandom.com/wiki/Simplifying_regular_expressions_using_magic_and_no-magic
vim.g.ale_pattern_options = {
  ['\\v\\.env(.dist)?$'] = {
    ale_linters = {},
  },
}
