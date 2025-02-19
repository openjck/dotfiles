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
-- Taking "keys" as the parameter argument allows mappings to more easily be
-- sorted alphabetically by keys.
function leader_map(keys, action, description, remap)
  remap = remap or false

  vim.keymap.set(
    'n',
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

leader_map('fd', telescopeCustom.dotfiles, 'Find dotfiles')
leader_map('fh', telescopeBuiltin.help_tags, 'Find help')
leader_map('fp', telescopeBuiltin.find_files, 'Find project files')

------------------------
-- Edit (as in :edit) --
------------------------

leader_map('en', '<Cmd>next<CR>', 'Edit next')
leader_map('ep', '<Cmd>previous<CR>', 'Edit previous')

----------
-- Hide --
----------

leader_map('hh', '<Cmd>nohlsearch<CR>', 'Hide highlights')

----------
-- Tabs --
----------

for number = 1, 9 do
  leader_map(
    string.format('t%d', number),
    string.format('<Cmd>tabnext %d<CR>', number),
    string.format('Tab %d', number)
  )
end

leader_map('t$', '<Cmd>tablast<CR>', 'Tab last')
leader_map('t0', '<Cmd>tabfirst<CR>', 'Tab first')
leader_map('tc', '<Cmd>tabclose<CR>', 'Tab close')
leader_map('te', '<Cmd>tabonly<CR>', 'Tab exclusive (close others)')
leader_map('tm$', '<Cmd>tabmove $<CR>', 'Tab move last')
leader_map('tm0', '<Cmd>tabmove 0<CR>', 'Tab move first')
leader_map('tmh', '<Cmd>-tabmove<CR>', 'Tab move left')
leader_map('tml', '<Cmd>+tabmove<CR>', 'Tab move right')
leader_map('tn', '<Cmd>tabnext<CR>', 'Tab next')
leader_map('to', '<Cmd>tabnew<CR>', 'Tab open')
leader_map('tp', '<Cmd>tabprevious<CR>', 'Tab previous')
