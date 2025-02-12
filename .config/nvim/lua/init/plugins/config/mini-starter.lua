local starter = require('mini.starter')

-- More closely emulate vim-startify.
--
-- This configuration is based on an example configuration shared in the
-- mini.starter docs for exactly this purpose, emulating vim-startify.
--
-- I like that this configuration shows files from the current directory and
-- files from other directories in separate sections. That can be crucially
-- helpful when there are multiple files on a machine with the same name. The
-- biggest benefit of this configuration, however, is that it allows me to open
-- a new buffer with a single, consistent, unambiguous key (e) and also select
-- files with a single, unambiguous key. That's not the case in the default
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

    -- Show only 4 items per section.
    --
    -- If there were 5 items per section, the key "1" would be ambiguous.
    -- "Enter" would need to be pressed to select the first match, and "1#"
    -- would be needed to select a match in the 10-19 range.
    starter.sections.recent_files(4, true),
    starter.sections.recent_files(4, false),
  },

  content_hooks = {
    starter.gen_hook.adding_bullet(),
    starter.gen_hook.indexing('all', { 'Builtin actions' }),
    starter.gen_hook.padding(3, 2),
  },
})
