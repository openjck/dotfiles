" Do not hard-wrap all text automatically. This can be very annoying when it
" hard-wraps code.
"
" Note the there is a separate option, c, for hard-wrapping comment text
" automatically.
set formatoptions-=t

" Hard wrap at 80 characters.
set textwidth=80

" Don't add newlines to existing files that do not have them. This does the same
" thing that the old PreserveNoEOL plugin did.
set nofixendofline

" Use one space after punctuation, not two, when reformatting lines with gq.
set nojoinspaces

" Enable persistent undo. In other words, remember undo history for files even
" after those files are closed and reopened.
set undofile
