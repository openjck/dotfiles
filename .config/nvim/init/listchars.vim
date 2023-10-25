" Specify utf-8 file encoding, as we use utf-8 characters in the listchars
" configuration. vint raises a warning if this is not present.
scriptencoding utf-8

" Show custom listchars. Neovim sets some defaults, but I prefer to use
" characters that are unlikely to appear in source code.
"
" These characters are a mix of the characters suggested in the following
" thread:
"
" https://www.reddit.com/r/vim/comments/4hoa6e/what_do_you_use_for_your_listchars/
set list
set listchars=tab:▸-,trail:█,extends:⟩,precedes:⟨,nbsp:␣,
