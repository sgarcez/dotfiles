local ncmd = vim.api.nvim_command
ncmd [[source $HOME/.config/nvim/plugins.vim]]
ncmd [[source $HOME/.config/nvim/autocmd.vim]]
ncmd [[source $HOME/.config/nvim/config.vim]]
ncmd [[source $HOME/.config/nvim/mappings.vim]]
require('lsp')
