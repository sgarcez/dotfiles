---@module "snacks"
return {
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			preset = {
				header = [[
              .7
            .'/
           / /
          / /
         / /
        / /
       / /
      / /
     / /
    / /
  __|/
,-\__\
|f-"Y\|
\()7L/
 cgD                            __ _
 |\(                          .'  Y '>,
  \ \                        / _   _   \
   \\\                       )(_) (_)(|}
    \\\                      {  4A   } /
     \\\                      \uLuJJ/\l
      \\\                     |3    p)/
       \\\___ __________      /nnm_n//
       c7___-__,__-)\,__)(".  \_>-<_/D
                  //V     \_"-._.__G G_c__.-__<"/ ( \
                         <"-._>__-,G_.___)\   \7\
                        ("-.__.| \"<.__.-" )   \ \
                        |"-.__"\  |"-.__.-".\   \ \
                        ("-.__"". \"-.__.-".|    \_\
                        \"-.__""|!|"-.__.-".)     \ \
                         "-.__""\_|"-.__.-"./      \ l
                          ".__""">G>-.__.-">       .--,_
                              ""  G
]],
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
					{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
					{ icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
					{ icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
			formats = {
				header = { "%s", align = "left" },
			},
		},
		input = { enabled = true },
		image = { enabled = false },
		animate = { enabled = true },
		gitbrowse = { enabled = true },
		notifier = {
			enabled = true,
			timeout = 3000,
		},
		explorer = {
			enabled = true,
			auto_close = true,
		},
		picker = {
			enabled = true,
			prompt = "◊ ",
			icons = {
				files = {
					enabled = false,
				},
			},
		},
		scroll = { enabled = true },
		statuscolumn = { enabled = false },
		zen = { enabled = false },
		scratch = { enabled = true },
		terminal = { enabled = true },
	},
	keys = {
		-- Top Pickers & Explorer
		{ "<leader><leader>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
		{ "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
		-- find
		{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
		{ "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
		{ "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
		{ "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
		{ "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
		{ "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
		-- git
		{ "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
		{ "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
		{ "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
		{ "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
		{ "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
		{ "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
		{ "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
		-- Grep
		{ "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
		{ "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
		{ "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
		{ "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
		-- search
		{ '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
		{ "<leader>s/", function() Snacks.picker.search_history() end, desc = "Search History" },
		{ "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
		{ "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
		{ "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
		{ "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
		{ "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
		{ "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
		{ "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
		{ "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
		{ "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
		{ "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
		{ "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
		{ "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
		{ "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
		{ "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
		{ "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
		{ "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
		{ "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
		{ "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
		-- LSP
		{ "<leader>ld", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
		{ "<leader>lD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
		{ "<leader>lr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
		{ "<leader>li", function() Snacks.picker.lsp_incoming_calls() end, desc = "Incoming Calls" },
		{ "<leader>lm", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementations" },
		{ "<leader>ly", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
		{ "<leader>ls", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
		{ "<leader>lS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
		-- Other
		{ "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
		{ "<leader>N", function() Snacks.notifier.show_history() end, desc = "Notification History" },
		{ "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
		-- { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
		{ "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
		{ "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
		{ "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
				Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
				Snacks.toggle.line_number():map("<leader>ul")
				Snacks.toggle.inlay_hints():map("<leader>uh")
				Snacks.toggle({
					name = "Diffview",
					get = function() return require("diffview.lib").get_current_view() ~= nil end,
					set = function(state) vim.cmd("Diffview" .. (state and "Open" or "Close")) end,
				}):map("<leader>ud")
			end,
		})
	end,
}
