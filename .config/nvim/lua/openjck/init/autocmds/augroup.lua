-- Create an augroup named "init" which custom autocmds can be registered to.
--
-- As soon as it's created, this "init" augroup clears (deactivates) all
-- autocmds which were previously registered to it. That way, if any of the
-- autocmds in this directory are created again during a single Neovim session
-- (for example, because the "Reconfigure" command was run), those autocmds are
-- not registered a _second_ time, which would cause duplicative behavior.
--
-- autocmds are kind of like JavaScript event listeners. Clearing autocmds in
-- the "init" augroup as soon as the "init" augroup is created, as we do
-- here, is kind of like using "removeEventListener" when a React component
-- unmounts. If that weren't done, there would be multiple copies of each event
-- listener which do the same thing, causing duplicative behavior.
--
-- To verify what is being described here, create an autocmd which prints some
-- text whenever a buffer is written. Make sure the autocmd is **not**
-- registered to this "init" augroup. Then, open a file, run "Reconfigure"
-- several times, and save the file. You'll notice that the text is printed
-- multiple times. That's why we need this augroup: we don't want autocmds
-- running several times after "Reconfigure" is used. At best, running several
-- times is unnecessary. At worst, it could cause problems.
--
-- When Vimscript and vint are being used, vint warns if this is not done.
-- That's how I first learned about the importance of doing this. At the time of
-- this writing, vint doesn't support Lua-based Neovim configuration files (nor
-- would it really make sense to), but this is still an important thing to do.
vim.api.nvim_create_augroup('init', { clear = true })
