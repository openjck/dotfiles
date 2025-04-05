-- I don't use the mouse often when using Neovim, but it can be useful when my
-- hand is already on the mouse, for example because I was interacting with
-- another window. It can also be helpful when someone else is controlling my
-- screen.

-- 30 seems to work well for vertical scrolling. I don't know if 30 works well
-- for horizontal scrolling, but it's the value I'm using for now. I don't have
-- a mouse which supports vertical scrolling to test it out on.
vim.opt.mousescroll = 'ver:30,hor:30'
