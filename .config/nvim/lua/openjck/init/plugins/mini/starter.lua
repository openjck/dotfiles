local starter = require('mini.starter')

-- More closely emulate vim-startify.
--
-- This configuration is based on an example configuration published in the
-- mini.starter docs for exactly this purpose, emulating vim-startify.
--
-- I like that this configuration shows files from the current directory and
-- files from other directories in separate sections. That can be crucially
-- helpful when there are multiple files on a machine with the same name. The
-- biggest benefit of this configuration, however, is that it allows me to open
-- a new buffer with a single, consistent, unambiguous key (e) and also select
-- any listed file with two keys. That's not the case in the default
-- configuration, where several keys are sometimes needed to select a file.
-- (Technically, even in the default configuration, CTRL-C can be used to open
-- an empty buffer immediately, but "e" is a bit simpler.)
starter.setup({
  -- Do not require the "Enter" key to be pressed after making a selection.
  evaluate_single = true,

  -- Do not show the header, which doesn't provide any useful information, but
  -- rather welcomes one by name.
  header = '',

  items = {
    starter.sections.builtin_actions(),
    starter.sections.recent_files(5, true),
    starter.sections.recent_files(5, false),
  },

  content_hooks = {
    starter.gen_hook.adding_bullet(),
    starter.gen_hook.indexing('section', { 'Builtin actions' }),
    starter.gen_hook.padding(3, 1),
  },
})
