local completion = {}
local utils = require'utils'
utils.opt('o', 'pumheight' , 15)
vim.cmd('set completeopt=menuone,noselect')

require'compe'.setup({
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  source = {
    path = false;
    buffer = true;
    calc = false;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = false;
    spell = false;
    tags = false;
    snippets_nvim = false;
    treesitter = true;
  }
})

local function check_back_space()
  local col = vim.fn.col('.') - 1
  return col <= 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

function completion.tab_completion()
  if vim.fn['vsnip#jumpable'](1) > 0 then
    return utils.esc('<Plug>(vsnip-jump-next)')
  end

  if vim.fn.pumvisible() > 0 then
    return utils.esc('<C-n>')
  end

  if check_back_space() then
    return utils.esc('<TAB>')
  end

  if vim.fn['vsnip#expandable']() > 0 then
    return utils.esc('<Plug>(vsnip-expand)')
  end

  return vim.fn['compe#complete']()
end

utils.keymap('i', '<C-l>', 'v:lua.sg.completion.tab_completion()', { expr = true, noremap = false })
utils.keymap('s', '<C-l>', 'vsnip#available(1)  ? "<Plug>(vsnip-expand-or-jump)" : "<TAB>"', {expr = true, noremap = false})

utils.keymap('i', '<TAB>', 'v:lua.sg.completion.tab_completion()', { expr = true, noremap = false })
utils.keymap('i', '<S-TAB>', 'pumvisible() ? "<C-p>" : vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-TAB>"', {expr = true, noremap = false})

utils.keymap('s', '<TAB>', 'vsnip#available(1)  ? "<Plug>(vsnip-expand-or-jump)" : "<TAB>"', {expr = true, noremap = false})
utils.keymap('s', '<S-TAB>', 'vsnip#available(-1)  ? "<Plug>(vsnip-jump-prev)" : "<S-TAB>"', { expr = true, noremap = false })


utils.keymap("i", "<C-Space>", "compe#complete()", { noremap = true, silent = true, expr = true })
utils.keymap("i", "<CR>", "compe#confirm('<CR>')", { noremap = true, silent = true, expr = true })

local ignores = {
  '*.o',
  '*.obj,*~',
  '*.git*',
  '*vim/backups*',
  '*mypy_cache*',
  '*__pycache__*',
  '*cache*',
  '*logs*',
  'log/**',
  'tmp/**',
}

utils.opt('o', 'wildignore', table.concat(ignores, ','))

_G.sg.completion = completion
