require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = ".",
      scope_incremental = "grc",
      node_decremental = ",",
    }
  },
  ensure_installed = {"go", "python", "lua", "rust"}
}
