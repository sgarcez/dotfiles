local cmp = require 'cmp'
require('cmp_luasnip_choice').setup { auto_open = true }
local luasnip = require 'luasnip'
luasnip.setup { region_check_events = 'InsertEnter', delete_check_events = 'InsertEnter' }

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
end

cmp.setup({
    completion = {
      completeopt = "menu,menuone,noinsert",
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable,
        ['<C-e>'] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        ['<cr>'] = cmp.mapping.confirm { select = true, behavior = cmp.ConfirmBehavior.Replace },
        ['<c-n>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<c-p>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    sources = cmp.config.sources({
        { name = 'luasnip_choice' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'calc' },
        { name = 'emoji' },
    }),
    window = {
        completion = cmp.config.window.bordered({
            -- winhighlight = 'Normal:Normal,FloatBorder:TelescopeBorder,CursorLine:Visual,Search:None',
            winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None',
            border = 'rounded',
        }),
        documentation = cmp.config.window.bordered({
            winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None',
            border = 'rounded',
        }),
    },
    formatting = {
        fields = { 'menu', 'abbr', 'kind' },
        -- format = function(entry, item)
        --     local menu_icon = {
        --         nvim_lsp = 'λ',
        --         vsnip = '⋗',
        --         buffer = 'Ω',
        --         -- path = '🖫',
        --     }
        --     item.menu = menu_icon[entry.source.name]
        --     return item
        -- end,
    },
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { { name = 'nvim_lsp_document_symbol' }, { name = 'buffer' } },
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } }),
})

-- vim.keymap.set('i', '<C-j>', 'vsnip#expandable() ? "<Plug>(vsnip-expand)" : "<C-j>"', { expr = true, noremap = false })
-- vim.keymap.set('s', '<C-j>', 'vsnip#expandable() ? "<Plug>(vsnip-expand)" : "<C-j>"', { expr = true, noremap = false })
-- vim.keymap.set('i', '<C-h>', 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-h>"',
--     { expr = true, noremap = false })
-- vim.keymap.set('i', '<C-h>', 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-h>"',
--     { expr = true, noremap = false })
-- vim.keymap.set('i', '<C-l>', 'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<C-l>"', { expr = true, noremap = false })
-- vim.keymap.set('s', '<C-l>', 'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<C-l>"', { expr = true, noremap = false })
-- vim.keymap.set('i', '<C-h>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-h>"', { expr = true, noremap = false })
-- vim.keymap.set('s', '<C-h>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-h>"', { expr = true, noremap = false })

-- vim.keymap.set('i', '<C-">', '<Plug>(copilot-next)', { noremap = true })
-- vim.keymap.set('i', '<C-:>', '<Plug>(copilot-previous)', { noremap = true })

-- vim.keymap.set('i', '<C-[>', '<Plug>(copilot-next)')
-- vim.keymap.set('i', '<C-]>', '<Plug>(copilot-previous)')
