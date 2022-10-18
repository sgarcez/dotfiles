local cmp = require 'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'calc' },
        { name = 'emoji' },
        { name = 'path' },
    }, {
        { name = 'buffer' },
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
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

local utils = require('utils')

utils.keymap('i', '<C-j>', 'vsnip#expandable() ? "<Plug>(vsnip-expand)" : "<C-j>"', { expr = true, noremap = false })
utils.keymap('s', '<C-j>', 'vsnip#expandable() ? "<Plug>(vsnip-expand)" : "<C-j>"', { expr = true, noremap = false })
utils.keymap('i', '<C-h>', 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-h>"',
    { expr = true, noremap = false })
utils.keymap('i', '<C-h>', 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-h>"',
    { expr = true, noremap = false })
utils.keymap('i', '<C-l>', 'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<C-l>"', { expr = true, noremap = false })
utils.keymap('s', '<C-l>', 'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<C-l>"', { expr = true, noremap = false })
utils.keymap('i', '<C-h>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-h>"', { expr = true, noremap = false })
utils.keymap('s', '<C-h>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-h>"', { expr = true, noremap = false })
