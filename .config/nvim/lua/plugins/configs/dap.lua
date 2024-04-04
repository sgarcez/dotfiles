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

dap.adapters.delve = {
	type = "server",
	port = "${port}",
	executable = {
		command = "dlv",
		args = { "dap", "-l", "127.0.0.1:${port}" },
	},
}

dap.configurations.go = {
	{
		type = "delve",
		name = "Debug",
		request = "launch",
		program = "${file}",
	},
	{
		type = "delve_connect",
		name = "Connect to 40001",
		request = "attach",
		mode = "remote",
		port = 40001,
		substitutePath = {
			{
				from = "${workspaceFolder}",
				to = "/go/src/github.com/--/--",
			},
			{
				from = "/go/src/github.com/--/--",
				to = "${workspaceFolder}",
			},
		},
	},
	{
		type = "delve",
		name = "Debug test pkg",
		request = "launch",
		mode = "test",
		program = "./${relativeFileDirname}",
	},
}

dapui.setup()
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end
