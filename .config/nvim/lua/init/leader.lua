local telescopeBuiltin = require('telescope.builtin')
local telescopeCustom = require('entities.telescope')

-- Some general notes:
--
-- mini.basics already sets the leader to the space key. Additionally, because
-- mini.clue is being used, the space key does not fall back to its default
-- behavior (moving forward one character) when "timeoutlen" expires. Rather,
-- the clue window is opened when "timeoutlen" expires.
--
-- One should almost always disable remaps. An exception is that mappings to
-- "<Plug>" mappings should _enable_ remaps because they are themselves mappings
-- that need to be looked up, so to speak.
--
-- I use "<Plug>" mappings as values whenever possible. I'm not completely
-- convinced of the benefits of doing this, but it seems to be a best
-- practice.[2]
--
-- [1] https://learnvimscriptthehardway.stevelosh.com/chapters/05.html#nonrecursive-mapping
-- [2] https://www.reddit.com/r/vim/comments/bgf3zt/why_should_i_use_plug_in_my_mappings_instead_of/

-- Create a mapping from normal mode that uses the <Leader> key as a prefix.
--
-- "modes" can be either a string (e.g., 'n') or a table (e.g., { 'n', 'x' }).
--
-- Taking "modes" as the first parameter and "keys" as the second parameter
-- allows mappings to be sorted alphabetically first by mode(s), then by keys.
local function leader_map(modes, keys, action, description, remap)
  remap = remap or false

  vim.keymap.set(
    modes,
    string.format('<Leader>%s', keys),
    action,
    {
      desc = description,
      remap = remap,
    }
  )
end

----------
-- Find --
----------

leader_map('n', 'fd', telescopeCustom.dotfiles, 'Dotfiles')
leader_map('n', 'fh', telescopeBuiltin.help_tags, 'Help')
leader_map('n', 'fs', telescopeBuiltin.planets, 'Solar system')

leader_map(
  'n',
  'fc',
  telescopeCustom.find_files_including_hidden,
  'Current working directory files'
)

leader_map(
  'n',
  'fp',
  telescopeCustom.git_files_including_untracked,
  'Project files'
)

------------------------
-- Edit (as in :edit) --
------------------------

leader_map('n', 'en', '<Cmd>next<CR>', 'Next')
leader_map('n', 'ep', '<Cmd>previous<CR>', 'Previous')

--------
-- Go --
--------

-- Some of these mappings go to the relevant code in a new tab. The following
-- Reddit answer explained to me how it can be done.
--
-- https://www.reddit.com/r/neovim/comments/1abayyi/comment/kjmlxah/

leader_map(
  'n',
  'gd',
  '<Cmd>tab split | lua vim.lsp.buf.definition()<CR>',
  'Definition'
)

leader_map(
  'n',
  'gt',
  '<Cmd>tab split | lua vim.lsp.buf.type_definition()<CR>',
  'Type'
)

-- Set up mappings for issues (e.g., linter issues and other diagnostic issues).
leader_map('n', 'gin', vim.diagnostic.goto_next, 'Next')
leader_map('n', 'gip', vim.diagnostic.goto_prev, 'Previous')

----------
-- Hide --
----------

leader_map('n', 'hh', '<Cmd>nohlsearch<CR>', 'Highlights')

------------
-- Modify --
------------

leader_map('n', 'mr', vim.lsp.buf.rename, 'Rename')

---------
-- Tab --
---------

for number = 1, 9 do
  leader_map(
    'n',
    string.format('t%d', number),
    string.format('<Cmd>tabnext %d<CR>', number),
    string.format('Tab %d', number)
  )
end

leader_map('n', 't$', '<Cmd>tablast<CR>', 'Last')
leader_map('n', 't0', '<Cmd>tabfirst<CR>', 'First')
leader_map('n', 'te', '<Cmd>tabonly<CR>', 'Exclusive (close all others)')
leader_map('n', 'th', '<Cmd>tabprevious<CR>', 'Left')
leader_map('n', 'tl', '<Cmd>tabnext<CR>', 'Right')
leader_map('n', 'tn', '<Cmd>tabnew<CR>', 'New')
leader_map('n', 'tx', '<Cmd>tabclose<CR>', 'Close')

-- Set up mappings for the "Tab move" submode.
leader_map('n', 'tm$', '<Cmd>tabmove $<CR>', 'Last')
leader_map('n', 'tm0', '<Cmd>tabmove 0<CR>', 'First')
leader_map('n', 'tmh', '<Cmd>-tabmove<CR>', 'Left')
leader_map('n', 'tml', '<Cmd>+tabmove<CR>', 'Right')

----------
-- Show --
----------

leader_map('n', 'sd', vim.lsp.buf.hover, 'Documentation')
leader_map('n', 'sm', vim.diagnostic.open_float, 'Message')
leader_map('n', 'sr', vim.lsp.buf.references, 'References')

----------------------
-- System clipboard --
----------------------

-- These are the only leader maps that don't share a namespace (e.g., s), only
-- because it's more convenient to type two characters (e.g., <Leader>y) than
-- three (e.g., <Leader>sy), and these maps are used often. The built-in motions
-- (e.g., "+y) use three characters, so it wouldn't be much of an improvement to
-- use a leader map that requires typing three characters. (It might be a slight
-- improvement because typing motions like "+y is awkward, in part because they
-- require the hand to take such a strange shape and in part because they
-- require the use of the shift key.)

leader_map('n', 'P', '"+P', 'Paste above from system clipboard')
leader_map('n', 'p', '"+p', 'Paste below from system clipboard')
leader_map('x', 'd', '"+d', 'Delete (cut) to system clipboard')
leader_map('x', 'y', '"+y', 'Yank (copy) to system clipboard')
