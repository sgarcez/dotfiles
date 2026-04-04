-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
-- https://gist.github.com/ciarand/0769c90e16802081914d1b1aa2ddfac6
-- https://github.com/mfussenegger/nvim-dap/issues/905#issuecomment-1615138269

local dap, dapui = require("dap"), require("dapui")

dap.adapters.delve_connect = function(cb, conf)
	cb({
		type = "server",
		port = conf["port"],
		executable = {
			command = "dlv",
			args = { "connect", string.format("localhost:%d", conf["port"]) },
		},
	})
end

-- Pure TCP connection to a headless dlv server (no local dlv subprocess).
-- Use this in per-project .nvim.lua files with request="attach", mode="remote".
dap.adapters.delve_headless = function(cb, conf)
	cb({
		type = "server",
		host = conf.host or "127.0.0.1",
		port = conf.port,
	})
end

dap.adapters.delve = {
	type = "server",
	port = "${port}",
	executable = {
		command = "dlv",
		args = { "--log", "--log-output=dap,debugger", "dap", "-l", "127.0.0.1:${port}" },
	},
}

-- https://github.com/go-delve/delve/blob/master/Documentation/api/dap/README.md
-- Project-specific remote configurations (substitutePath etc.) should be added
-- in a per-project .nvim.lua file, e.g.:
--
--   table.insert(require("dap").configurations.go, {
--     type = "delve_headless",  -- pure TCP, no local dlv subprocess
--     name = "Connect to service",
--     request = "attach",
--     mode = "remote",
--     port = 2345,
--     substitutePath = {
--       { from = "${workspaceFolder}", to = "/src" },
--       { from = "/src", to = "${workspaceFolder}" },
--     },
--   })
dap.configurations.go = {
	{
		type = "delve",
		name = "Debug",
		request = "launch",
		program = "${file}",
	},
	{
		-- https://stackoverflow.com/questions/55643722/dlv-debug-fail-due-to-undefined-object-in-same-package
		-- https://stackoverflow.com/questions/77498761/how-to-create-a-debug-configuration-for-a-specific-go-file-in-vscode
		-- must set breakpoints before running
		type = "delve",
		name = "Debug cmd (Arguments)",
		request = "launch",
		mode = "debug",
		program = "${fileDirname}",
		args = function()
			local argument_string = vim.fn.input("Program arguments: ")
			return vim.fn.split(argument_string, " ", true)
		end,
	},
	{
		type = "delve",
		name = "Debug test pkg",
		request = "launch",
		mode = "test",
		program = "./${relativeFileDirname}",
	},
}

dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = "codelldb",
		args = { "--port", "${port}" },
	},
}

dap.adapters.rt_lldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = "lldb-dap",
		args = { "--port", "${port}" },
	},
}

dapui.setup()
dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
