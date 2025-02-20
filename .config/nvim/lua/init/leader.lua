local telescopeBuiltin = require('telescope.builtin')
local telescopeCustom = require('entities.telescope')

-- Some general notes:
--
-- mini.basics already sets the leader to the space key. Additionally, because
-- mini.clue is being used, the space key does not fall back to its default
-- behavior (moving forward one character) when "timeoutlen" expires. Rather,
-- the clue window is opened when "timeoutlen" expires.
--
-- With regard to "remaps", one should almost always disable remaps. An
-- exception to this rule is that mappings to "<Plug>" mappings should not use
-- "nore" commands because they are themselves mappings that need to be looked
-- up.
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
function leader_map(modes, keys, action, description, remap)
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

leader_map('n', 'fd', telescopeCustom.dotfiles, 'Find dotfiles')
leader_map('n', 'fh', telescopeBuiltin.help_tags, 'Find help')
leader_map('n', 'fp', telescopeBuiltin.find_files, 'Find project files')

------------------------
-- Edit (as in :edit) --
------------------------

leader_map('n', 'en', '<Cmd>next<CR>', 'Edit next')
leader_map('n', 'ep', '<Cmd>previous<CR>', 'Edit previous')

----------
-- Hide --
----------

leader_map('n', 'hh', '<Cmd>nohlsearch<CR>', 'Hide highlights')

----------
-- Tabs --
----------

for number = 1, 9 do
  leader_map(
    'n',
    string.format('t%d', number),
    string.format('<Cmd>tabnext %d<CR>', number),
    string.format('Tab %d', number)
  )
end

leader_map('n', 't$', '<Cmd>tablast<CR>', 'Tab last')
leader_map('n', 't0', '<Cmd>tabfirst<CR>', 'Tab first')
leader_map('n', 'tc', '<Cmd>tabclose<CR>', 'Tab close')
leader_map('n', 'te', '<Cmd>tabonly<CR>', 'Tab exclusive (close others)')
leader_map('n', 'tm$', '<Cmd>tabmove $<CR>', 'Tab move last')
leader_map('n', 'tm0', '<Cmd>tabmove 0<CR>', 'Tab move first')
leader_map('n', 'tmh', '<Cmd>-tabmove<CR>', 'Tab move left')
leader_map('n', 'tml', '<Cmd>+tabmove<CR>', 'Tab move right')
leader_map('n', 'tn', '<Cmd>tabnext<CR>', 'Tab next')
leader_map('n', 'to', '<Cmd>tabnew<CR>', 'Tab open')
leader_map('n', 'tp', '<Cmd>tabprevious<CR>', 'Tab previous')

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

leader_map('x', 'd', '"+d', 'Delete to system clipboard')
leader_map('x', 'P', '"+P', 'Paste above from system clipboard')
leader_map('x', 'p', '"+p', 'Paste from system clipboard')
leader_map('x', 'y', '"+y', 'Yank to system clipboard')
