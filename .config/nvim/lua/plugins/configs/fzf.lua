vim.g['fzf_layout'] = { window = { width = 0.9, height = 0.9 } }
vim.g['fzf_preview_window'] = { 'up:50%:+{2}-/2', 'ctrl-/' }

vim.fn.setenv("FZF_DEFAULT_COMMAND", "fd --type file --follow --hidden --exclude .git --exclude vendor --color=always")
