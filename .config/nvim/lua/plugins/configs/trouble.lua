local utils = require('utils')

require("trouble").setup {
    icons = false,
}

utils.keymap('n', '<Leader>lt', '<cmd>TroubleToggle<CR>')
