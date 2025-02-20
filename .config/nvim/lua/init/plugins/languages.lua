local add = MiniDeps.add

-- vim-polyglot describes itself as a language pack. It adds plugins for
-- languages that are not supported by Neovim out of the box, as well as plugins
-- that improve support for others.
--
-- The plugins vim-polyglot pulls in can sometimes be too clever, changing the
-- appearance or behavior of Neovim in ways I find annoying. Configuration may
-- be necessary in those cases.
add('sheerun/vim-polyglot')

-- Neither Neovim nor vim-polyglot supports KDL.
add('imsnif/kdl.vim')
