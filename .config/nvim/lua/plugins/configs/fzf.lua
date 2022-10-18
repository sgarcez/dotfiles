vim.g['fzf_layout'] = { window = { width = 0.9, height = 0.9 } }
vim.g['fzf_preview_window'] = { 'up:50%:+{2}-/2', 'ctrl-/' }

--     "FZF_DEFAULT_OPTS",
--     "--ansi --marker=+ --padding=1,1 --color=fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#2E3440,hl+:#A3BE8C,pointer:#BF616A,info:#2E3440,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B"
-- )

vim.fn.setenv("FZF_DEFAULT_COMMAND", "fd --type file --follow --hidden --exclude .git --exclude vendor --color=always")

-- local utils = require('utils')
-- utils.keymap("n", "<Leader><Leader>", "<cmd>:Files<CR>")
-- utils.keymap("n", "<Leader>b", "<cmd>:Buffers<CR>")
-- utils.keymap("n", "<Leader>r", ":Rg <C-R><C-W><CR>")
