# Notes about filetype logic

## did_load_filetypes

It is [recommended](https://vim.fandom.com/wiki/Filetype.vim#File_structure) to
always check whether `did_load_filetypes` exists before doing anything in an
ftdetect file. This [acts like an include
guard](https://stackoverflow.com/a/25975659/4297741), ensuring that any code
that follows is not run multiple times if Neovim is re-initialized. To see what
happens if the `exists` check is not done, remove the check and echo a string
anywhere below it. Run `:source $XDG_CONFIG_HOME/nvim/init.vim` multiple times.
Notice that the string is echoed each time. So too would autocmds be set
multiple times, unnecessarily, if the check were not present.

That said, _sh.vim_ will not work as expected if this check is present. I'm not
exactly sure why, as it's unclear to me what runs when, but I notice that the
filetype is set to `conf` if the _sh.vim_ script is removed. Perhaps
`did_load_filetypes` is set after the filetype is set to `conf` but before
_sh.vim_ runs.
