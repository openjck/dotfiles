" Add a "Reconfigure" command to reconfigure an active Neovim session based on
" the latest configuration. (This is sort of like "rebash" for Neovim.)
"
" The "-bar" flag adds support for combining this command with other commands.
" This is used in leader.vim.
command! -bar Reconfigure source $XDG_CONFIG_HOME/nvim/init.vim
