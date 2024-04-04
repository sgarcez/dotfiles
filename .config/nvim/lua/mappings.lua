vim.keymap.set("n", "<CR>", ":noh<CR><CR>")
vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR><Esc>")

vim.keymap.set("t", "<leader><Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<BS>", "<c-^>")

vim.keymap.set("n", "<Leader>w", "<Esc>:w<CR>")
vim.keymap.set("n", "<Leader>q", "<Esc>:q<CR>")
vim.keymap.set("n", "Q", "<Esc>:qa<CR>")

vim.keymap.set("n", "<Leader>n", ":set number! number?<CR>")

-- Replace word under cursor
vim.keymap.set("n", "<Leader>sr", ":%s/<C-r><C-w>//g<Left><Left>")

-- split/join args
vim.keymap.set("n", "<leader>m", require("treesj").toggle)

-- Oil (file browser)
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- buffer and tabs
vim.keymap.set("n", "[b", ":bprevious<CR>")
vim.keymap.set("n", "]b", ":bnext<CR>")
vim.keymap.set("n", "[t", ":tabprevious<CR>")
vim.keymap.set("n", "]t", ":tabnext<CR>")
vim.keymap.set("n", "<Leader>tt", ":tab split<CR>")

-- splits
vim.keymap.set("n", "<Leader>hh", ":leftabove vsplit<CR>")
vim.keymap.set("n", "<Leader>ll", ":rightbelow vsplit<CR>")
vim.keymap.set("n", "<Leader>kk", ":leftabove split<CR>")
vim.keymap.set("n", "<Leader>jj", ":rightbelow split<CR>")

-- terminal
vim.keymap.set("n", "<Leader>h<Enter>", ":leftabove  vnew<CR>:terminal<CR>:startinsert<CR>")
vim.keymap.set("n", "<Leader>l<Enter>", ":rightbelow vnew<CR>:terminal<CR>:startinsert<CR>")
vim.keymap.set("n", "<Leader>k<Enter>", ":leftabove  new<CR>:terminal<CR>:startinsert<CR>")
vim.keymap.set("n", "<Leader>j<Enter>", ":rightbelow new<CR>:terminal<CR>:startinsert<CR>")

-- lsp
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-]>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.keymap.set("n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
vim.keymap.set("n", "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
vim.keymap.set("v", "<leader>lf", ":<C-u>call v:lua.vim.lsp.buf.range_formatting()<CR>", opts)
vim.keymap.set("n", "<Leader>ln", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
vim.keymap.set("n", "<Leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
vim.keymap.set("n", "<Leader>lce", "<cmd>lua vim.lsp.codelens.refresh()<CR>", opts)
vim.keymap.set("n", "<Leader>lcr", "<cmd>lua vim.lsp.codelens.run()<CR>", opts)

-- telescope
vim.keymap.set("n", "<Leader><Leader>", ":Telescope find_files<CR>")
vim.keymap.set("n", "<Leader>b", ":Telescope buffers<CR>")
vim.keymap.set("n", "<Leader>f", ":Telescope grep_string<CR>")
vim.keymap.set("n", "<Leader>r", ":Telescope live_grep<CR>")

-- telescope lsp
vim.keymap.set("n", "<Leader>ld", ":Telescope lsp_definitions<CR>")
vim.keymap.set("n", "<Leader>lr", ":Telescope lsp_references<CR>")
vim.keymap.set("n", "<Leader>li", ":Telescope lsp_incoming_calls<CR>")
vim.keymap.set("n", "<Leader>lo", ":Telescope lsp_outgoing_calls<CR>")
vim.keymap.set("n", "<Leader>lm", ":Telescope lsp_implementations<CR>")
vim.keymap.set("n", "<Leader>ls", ":Telescope lsp_document_symbols ignore_symbols=variable,field<CR>")
vim.keymap.set("n", "<Leader>ld", ":Telescope lsp_definitions<CR>")
-- vim.keymap.set("n", "<Leader>ld", ":Telescope diagnostics bufnr=0 <CR>")

-- trouble
vim.keymap.set("n", "<Leader>lt", "<cmd>TroubleToggle<CR>")

-- neotest
vim.keymap.set("n", "<Leader>tr", ":lua require'neotest'.run.run()<CR>")
vim.keymap.set("n", "<Leader>tf", ":lua require'neotest.run.run(vim.fn.expand('%'))'<CR>")
vim.keymap.set("n", "<Leader>ta", ":lua require'neotest.run.attach()'<CR>")
vim.keymap.set("n", "<Leader>to", ":lua require'neotest.output.open()'<CR>")
vim.keymap.set("n", "<Leader>ts", ":lua require'neotest.summary()'<CR>")

-- dap
vim.keymap.set("n", "<Leader>dt", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<Leader>dr", ":lua require'dap'.repl.toggle()<CR>")
vim.keymap.set("n", "<Leader>dc", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<Leader>ds", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<Leader>di", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<Leader>do", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<Leader>dut", ":lua require'dapui'.toggle()<CR>")

-- lazygit
vim.keymap.set("n", "<Leader>g", ":LazyGit<CR>")

-- zen mode
vim.keymap.set("n", "<Leader>z", ":ZenMode<CR>")
