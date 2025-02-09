" Hard wrap at 80 characters.
set textwidth=80

" Do not hard wrap all text automatically. This can be very annoying when it
" hard wraps code. Note that there is a separate option, c, for hard wrapping
" comment text automatically.
set formatoptions-=t

" Don't add newlines to existing files that do not have them. This does the same
" thing as the old PreserveNoEOL plugin.
set nofixendofline

" Use one space after punctuation, not two, when reformatting lines with gq.
set nojoinspaces

" When using CTRL-A and CTRL-X, treat all numbers as unsigned.
"
" With this option enabled, any number with a dash before it is considered to be
" a positive number. For example, in "2024-06-05", the "06" is considered to be
" the number 6, not the number -6. Therefore, CTRL-A changes it to "07", whereas
" CTRL-A would change it to "05" if this option were not enabled.
"
" One drawback, which seems unavoidable without some kind of plugin, is that
" this option makes it impossible to use CTRL-A and CTRL-X when the resulting
" number would actually be negative. For example, with this option enabled,
" using CTRL-X on the number "0" has no effect. I'll happily take that tradeoff
" because I find working with a positive number that's preceded by a dash is
" more common than working with a number that's actually negative.
set nrformats+=unsigned
