MiniDeps.add('navarasu/onedark.nvim')

require('onedark').setup  {
    highlights = {
      -- Make diagnostic floats and other floats stand out more.
      NormalFloat = { bg = '$bg3' },
    },
}
