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

----------------------------
-- Dependencies (plugins) --
----------------------------

-- In these maps, "Reconfigure" is run first to ensure mini.deps picks up on the
-- latest plugin configuration before acting on plugins.

leader_map('n', 'dc', '<Cmd>Reconfigure <Bar> DepsClean!<CR>', 'Clean')
leader_map('n', 'du', '<Cmd>Reconfigure <Bar> DepsUpdate!<CR>', 'Update')

------------------------
-- Edit (as in :edit) --
------------------------

leader_map('n', 'en', vim.cmd.next, 'Next')
leader_map('n', 'ep', vim.cmd.previous, 'Previous')

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

--------
-- Go --
--------

-- Some of these mappings go to the relevant code in a new tab. The following
-- Reddit answer explained to me how it can be done.
--
-- https://www.reddit.com/r/neovim/comments/1abayyi/comment/kjmlxah/

-- According to Neovim's LSP documentation, many language servers don't
-- implement this method. Neovim suggests using vim.lsp.buf.definition() (see
-- below) in those cases.
leader_map(
  'n',
  'gc',
  '<Cmd>tab split | lua vim.lsp.buf.declaration()<CR>',
  'De(c)laration'
)

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

-- Set up mappings for going to issues (e.g., linter issues and other diagnostic
-- issues).
leader_map('n', 'gin', vim.diagnostic.goto_next, 'Next')
leader_map('n', 'gip', vim.diagnostic.goto_prev, 'Previous')

----------
-- Hide --
----------

leader_map('n', 'hh', vim.cmd.nohlsearch, 'Highlights')

------------
-- Modify --
------------

leader_map('n', 'mf', vim.lsp.buf.format, 'Format')
leader_map('n', 'mr', vim.lsp.buf.rename, 'Rename')
leader_map('n', 'ms', vim.lsp.buf.code_action, 'Suggest')

-- Set up mappings for extracting.
--
-- These mappings should _not_ use "<Cmd>" and "<CR>" because a name needs to be
-- typed in before executing this command, and "<Cmd>" cannot be used unless
-- "<CR>" is also used.
leader_map('x', 'mef', ':Refactor extract ', 'Function')
leader_map('x', 'mev', ':Refactor extract_var ', 'Variable')

-- Set up mappings for inlining.
leader_map( 'n', 'mif', '<Cmd>Refactor inline_func<CR>', 'Function')
leader_map({ 'n', 'x' }, 'miv', '<Cmd>Refactor inline_var<CR>', 'Variable')

------------
-- Neovim --
------------

leader_map('n', 'nr', vim.cmd.Reconfigure, 'Reconfigure')

----------
-- Show --
----------

leader_map('n', 'sd', vim.lsp.buf.hover, 'Documentation')
leader_map('n', 'si', vim.lsp.buf.incoming_calls, 'Incoming calls')
leader_map('n', 'sm', vim.diagnostic.open_float, 'Message')
leader_map('n', 'sp', vim.lsp.buf.implementation, 'Im(p)lementation')
leader_map('n', 'so', vim.lsp.buf.outgoing_calls, 'Outgoing calls')
leader_map('n', 'sr', vim.lsp.buf.references, 'References')
leader_map('n', 'ss', vim.lsp.buf.signature_help, 'Signature')

-- Set up mappings for showing type hierarchy.
leader_map(
  'n',
  'stj',
  '<Cmd>vim.lsp.buf.typehierarchy("subtypes")<CR>',
  'Subtypes'
)
leader_map(
  'n',
  'stk',
  '<Cmd>vim.lsp.buf.typehierarchy("supertypes")<CR>' ,
  'Supertypes'
)

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

leader_map('n', 't$', vim.cmd.tablast, 'Last')
leader_map('n', 't0', vim.cmd.tabfirst, 'First')
leader_map('n', 'tc', vim.cmd.tabclose, 'Close')
leader_map('n', 'te', vim.cmd.tabonly, 'Exclusive (close all others)')
leader_map('n', 'th', vim.cmd.tabprevious, 'Left')
leader_map('n', 'tl', vim.cmd.tabnext, 'Right')
leader_map('n', 'tn', vim.cmd.tabnew, 'New')

-- Set up mappings for the "Tab move" submode.
leader_map('n', 'tm$', '<Cmd>tabmove $<CR>', 'Last')
leader_map('n', 'tm0', '<Cmd>tabmove 0<CR>', 'First')
leader_map('n', 'tmh', '<Cmd>-tabmove<CR>', 'Left')
leader_map('n', 'tml', '<Cmd>+tabmove<CR>', 'Right')

-----------
-- Utils --
-----------

leader_map('n', 'un', vim.cmd.Neogit, 'Neogit')
leader_map('n', 'uu', vim.cmd.MundoToggle, 'Undo')
