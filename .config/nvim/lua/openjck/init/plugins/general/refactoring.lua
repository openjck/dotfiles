-- refactoring.nvim is a little rough around the edges, and it doesn't support
-- all features in all languages. Still, it's better than nothing.
--
-- Someday, maybe these features will be supported by the Language Server
-- Protocol.
MiniDeps.add('ThePrimeagen/refactoring.nvim')

require('refactoring').setup()
