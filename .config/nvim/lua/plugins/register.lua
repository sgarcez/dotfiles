local raw_plugins = require("plugins.plugins")

local pack_specs = {}
local plugin_configs = {}

-- Helper to extract "plugin-name" from "user/plugin-name.nvim"
local function get_module_name(repo)
	local name = repo:match("/([^/]+)$")
	if not name then return repo end
	name = name:gsub("%.nvim$", "")
	name = name:gsub("%.lua$", "")
	name = name:gsub("^vim%-", "")
	name = name:gsub("^cmp%-", "")
	return name
end

-- Recursive function to parse lazy.nvim specs into vim.pack.Spec
local function parse_specs(specs)
	for _, spec in ipairs(specs) do
		local repo = type(spec) == "string" and spec or spec[1]
		if repo then
			local name = get_module_name(repo)
			local pack_spec = {
				src = "https://github.com/" .. repo,
				name = name,
			}

			if type(spec) == "table" then
				-- Handle versioning
				if spec.version then
					pack_spec.version = vim.version.range(spec.version)
				elseif spec.branch then
					pack_spec.version = spec.branch
				end

				-- Handle dependencies recursively
				if spec.dependencies then
					parse_specs(spec.dependencies)
				end

				-- Store configuration data for later
				plugin_configs[name] = {
					opts = spec.opts,
					config = spec.config,
					init = spec.init,
					keys = spec.keys,
				}
			end

			-- Only add if we haven't seen it, or if it has a version constraint
			local exists = false
			for i, existing_spec in ipairs(pack_specs) do
				if existing_spec.name == name then
					exists = true
					-- If the new spec has a version/branch but the existing doesn't, update it
					if pack_spec.version and not existing_spec.version then
						pack_specs[i].version = pack_spec.version
					end
					break
				end
			end
			
			if not exists then
				table.insert(pack_specs, pack_spec)
			end
		end
	end
end

parse_specs(raw_plugins)

-- 1. Run init functions (before loading plugins)
for _, conf in pairs(plugin_configs) do
	if conf.init then
		conf.init()
	end
end

-- 2. Add and load all plugins via vim.pack
vim.pack.add(pack_specs, { load = true })

-- 3. Configure plugins and set keymaps (after loading)
for name, conf in pairs(plugin_configs) do
	-- Run config function or default setup(opts)
	if conf.config then
		if type(conf.config) == "function" then
			conf.config()
		end
	elseif conf.opts then
		-- Automatically try to require the module and call setup
		local ok, mod = pcall(require, name)
		if ok and type(mod) == "table" and mod.setup then
			mod.setup(conf.opts)
		end
	end

	-- Map keys defined in the spec
	if conf.keys then
		for _, keymap in ipairs(conf.keys) do
			if type(keymap) == "table" then
				local mode = keymap.mode or "n"
				local lhs = keymap[1]
				local rhs = keymap[2] or keymap[3] -- sometimes rhs is a string or function
				local opts = { desc = keymap.desc, noremap = true, silent = true }

				if keymap.nowait then opts.nowait = true end

				if lhs and rhs then
					vim.keymap.set(mode, lhs, rhs, opts)
				end
			end
		end
	end
end
