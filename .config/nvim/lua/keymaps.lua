vim.keymap.set("n", "<CR>", ":noh<CR><CR>")
vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR><Esc>")

vim.keymap.set("t", "<leader><Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<BS>", "<c-^>")

vim.keymap.set("n", "<Leader>w", "<Esc>:w<CR>", { silent = true })
vim.keymap.set("n", "<Leader>q", "<Esc>:q<CR>")
vim.keymap.set("n", "Q", "<Esc>:qa<CR>")

vim.keymap.set("n", "<Leader>n", ":set number! number?<CR>")

-- Replace word under cursor
vim.keymap.set("n", "<Leader>sr", ":%s/<C-r><C-w>//g<Left><Left>")

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

-- resizing splits
vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous)

-- lsp
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-]>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.keymap.set("n", "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
vim.keymap.set("v", "<leader>lf", ":<C-u>call v:lua.vim.lsp.buf.range_formatting()<CR>", opts)
vim.keymap.set("n", "<Leader>ln", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
vim.keymap.set("n", "<Leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
-- vim.keymap.set("n", "<Leader>lce", "<cmd>lua vim.lsp.codelens.refresh()<CR>", opts)
-- vim.keymap.set("n", "<Leader>lcr", "<cmd>lua vim.lsp.codelens.run()<CR>", opts)
-- vim.keymap.set("n", "<Leader>lh", "<cmd>lua vim.lsp.buf_inlay_hints()<CR>", opts)
