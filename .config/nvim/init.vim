let g:vim_home = get(g:, 'vim_home', expand('~/.config/nvim/'))
let config_list = [
  \ 'plugins.vim',
  \ 'autocmd.vim',
  \ 'config.vim',
  \ 'keymappings.vim',
  \]
for files in config_list
  for f in glob(g:vim_home.files, 1, 1)
    exec 'source' f
  endfor
endfor

luafile ~/.config/nvim/lsp.lua
