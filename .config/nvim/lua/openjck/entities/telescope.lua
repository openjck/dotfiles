local exports = {}

local builtin = require('telescope.builtin')

function exports.dotfiles()
  builtin.find_files({
    prompt_title = 'dotfiles',
    find_command = {
      'bash',
      '-c',
      [[
        vcsh-list-all-files
      ]],
    }
  })
end

function exports.git_files_including_untracked()
  builtin.git_files({
    show_untracked = true,
  })
end

function exports.find_files_including_hidden()
  builtin.find_files({
    hidden = true,
  })
end

return exports
