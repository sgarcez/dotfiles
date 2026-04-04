local g = vim.g

-- Disable netrw
g.loaded_netrw       = 1
g.loaded_netrwPlugin = 1

-- Disable providers
g.loaded_ruby_provider    = 0
g.loaded_perl_provider    = 0
g.loaded_node_provider    = 0
g.loaded_python3_provider = 0

-- Mapleader <Leader>
g.mapleader = ';'

-- augment
-- g.augment_workspace_folders -- set per-project in .nvim.lua
g.augment_disable_completions = false
