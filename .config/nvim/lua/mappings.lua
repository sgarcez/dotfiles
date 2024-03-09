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

-- buffer and tabs
vim.keymap.set("n", "[b", ":bprevious<CR>")
vim.keymap.set("n", "]b", ":bnext<CR>")
vim.keymap.set("n", "[t", ":tabprevious<CR>")
vim.keymap.set("n", "]t", ":tabnext<CR>")

-- replaced by vim-tmux-navigator
-- window movement
-- vim.keymap.set('n', '<c-j>', '<c-w>j')
-- vim.keymap.set('n', '<c-k>', '<c-w>k')
-- vim.keymap.set('n', '<c-l>', '<c-w>l')
-- vim.keymap.set('n', '<c-h>', '<c-w>h')

-- splits
vim.keymap.set("n", "<Leader>hh", ":leftabove vsplit<CR>")
vim.keymap.set("n", "<Leader>ll", ":rightbelow vsplit<CR>")
vim.keymap.set("n", "<Leader>kk", ":leftabove split<CR>")
vim.keymap.set("n", "<Leader>jj", ":rightbelow split<CR>")
vim.keymap.set("n", "<Leader>tt", ":tab split<CR>")

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
-- vim.keymap.set("n", "<Leader>z", ":Telescope file_browser path=%:p:h<CR>")
vim.keymap.set("n", "<Leader>f", ":Telescope grep_string<CR>")
vim.keymap.set("n", "<Leader>r", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<Leader>ld", ":Telescope lsp_definitions<CR>")
vim.keymap.set("n", "<Leader>lr", ":Telescope lsp_references<CR>")
vim.keymap.set("n", "<Leader>li", ":Telescope lsp_incoming_calls<CR>")
vim.keymap.set("n", "<Leader>lo", ":Telescope lsp_outgoing_calls<CR>")
vim.keymap.set("n", "<Leader>lm", ":Telescope lsp_implementations<CR>")
vim.keymap.set("n", "<Leader>ls", ":Telescope lsp_document_symbols ignore_symbols=variable,field<CR>")
vim.keymap.set("n", "<Leader>d", ":Telescope diagnostics bufnr=0 <CR>")
vim.keymap.set("n", "<Leader>is", ":Telescope git_status <CR>")

local group = vim.api.nvim_create_augroup("vimgo", { clear = false })
vim.api.nvim_create_autocmd("FileType", {
	group = group,
	pattern = { "go" },
	callback = function()
		vim.keymap.set("n", "<Leader>gc", ":GoCoverage -f<CR>")
		vim.keymap.set("n", "<Leader>gt", ":GoTest -f <CR>")
		vim.keymap.set("n", "<Leader>gT", ":GoTestPkg -f<CR>")
		vim.keymap.set("n", "<Leader>gb", ":GoBuild<CR>")
		vim.keymap.set("n", "<Leader>gl", ":GoLint<CR>")
		vim.keymap.set("n", "<Leader>gi", ":GoToggleInlay<CR>")
	end,
})
