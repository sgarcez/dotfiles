local nvim_lsp = require'nvim_lsp'
local util = require'nvim_lsp/util'
local api = vim.api

local custom_on_attach = function()
    require'completion'.on_attach()
    require'diagnostic'.on_attach()
end

api.nvim_command [[autocmd CursorHold  <buffer> lua vim.lsp.util.show_line_diagnostics()]]


nvim_lsp.gopls.setup{
    on_attach = custom_on_attach,
    init_options = {
        usePlaceholders = true,
        completeUnimported = true,
        linkTarget = "pkg.go.dev",
        completionDocumentation = true,
        deepCompletion = true,
        fuzzyMatching = true,
    },
    capabilities = {
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = true
                }
            }
        }
    }
}

-- nvim_lsp.ccls.setup{}
-- nvim_lsp.html.setup{}

-- nvim_lsp.cssls.setup{
--     on_attach = custom_on_attach,
--     root_dir = util.root_pattern("package.json", ".git")
-- }
-- nvim_lsp.dockerls.setup{
--     on_attach = custom_on_attach
-- }

-- nvim_lsp.ghcide.setup{
--     on_attach = custom_on_attach
-- }

-- nvim_lsp.jsonls.setup{
--     on_attach = custom_on_attach
-- }

-- nvim_lsp.vimls.setup{
--     on_attach = custom_on_attach
-- }

-- nvim_lsp.efm.setup{
--     on_attach = custom_on_attach
-- }

-- nvim_lsp.pyls.setup{
--     on_attach = custom_on_attach,
--     settings = {
--         pyls = {
--             plugins = {
--                 jedi_completion = {
--                     enabled = true
--                 },
--                 jedi_symbols = {
--                     enabled = true,
--                     all_scopes = true
--                 },
--                 mccabe = {
--                     enabled = false
--                 },
--                 preload = {
--                     enabled = true
--                 },
--                 pydocstyle = {
--                     enabled = true
--                 },
--                 pyflakes = {
--                     enabled = true
--                 },
--                 pylint = {
--                     enabled = false
--                 },
--                 rope_completion = {
--                     enabled = true
--                 },
--                 black = {
--                     enabled = true
--                 },
--                 isort = {
--                     enabled = true
--                 }
--             }
--         }
--     }
-- }

-- nvim_lsp.sumneko_lua.setup{
--     on_attach = custom_on_attach,
--     settings = {
--         Lua = {
--             runtime = {
--                 version = "LuaJIT"
--             }
--         }
--     }
-- }

