### vim.filetype.add

When using Neovim and Lua, if one wants to set a `filetype` based on a filename,
it is usually recommended that they use `vim.filetype.add` rather than the
approach I'm using here in _json.lua_. However, for some reason, as of
2025-04-05, that does not work for me, even after lots of trial and error guided
by ChatGPT. It's possible I'm encountering a bug in Neovim. In any case, because
it doesn't work, I'm not using `vim.filetype.add` for now.

### did_load_filetypes

When one is using Vim and Vimscript, and they use an `autocmd` to set a
filetype, it's
[recommended](https://vim.fandom.com/wiki/Filetype.vim#File_structure) that they
exit immediately if `did_load_filetypes` exists so that the `autocmd` is not run
multiple times. In my "delta" Neovim configuration, when I was using Vimscript,
I did that in _json.vim_, and it worked as expected, preventing the `autocmd`
from being run multiple times. (I never did that in _sh.vim_ because it caused
that `autocmd` not to work for reasons I never understood.) In any case, ChatGPT
told me that this `did_load_filetypes` check should also happen in files like
_ftdetect/json.lua_, but when I tried using it, the `autocmd` didn't run.
Additionally, when I _don't_ use it, and I run `Reconfigure` multiple times, the
`autocmd` is _not_ run multiple times as it was when it was written in Vimscript
and the `did_load_filetypes` check was omitted. For those reasons, I don't do it
here.
