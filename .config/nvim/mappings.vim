nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

inoremap jk <Esc>

nnoremap <Leader>w <Esc>:w<CR>
nnoremap <Leader>q <Esc>:q<CR>
nnoremap <silent>Q <Esc>:q<CR>

nnoremap <Leader>sr :%s/\<<C-r><C-w>\>//g<Left><Left>

nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [t :tabprevious<CR>
nnoremap ]t :tabnext<CR>
nnoremap ]c :GitGutterNextHunk<CR>
nnoremap [c :GitGutterPrevHunk<CR>

nnoremap ]d <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap [d <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <leader>dl <cmd> lua vim.lsp.diagnostic.set_loclist()<CR>

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

nnoremap <silent> <Leader>hh :leftabove vsplit<CR>
nnoremap <silent> <Leader>ll :rightbelow vsplit<CR>
nnoremap <silent> <Leader>kk :leftabove split<CR>
nnoremap <silent> <Leader>jj :rightbelow split<CR>
nnoremap <silent> <Leader>tt :tab split<CR>

nnoremap <Leader>h<Enter> :leftabove  vnew<CR>:terminal<CR>:startinsert<CR>
nnoremap <Leader>l<Enter> :rightbelow vnew<CR>:terminal<CR>:startinsert<CR>
nnoremap <Leader>k<Enter> :leftabove  new<CR>:terminal<CR>:startinsert<CR>
nnoremap <Leader>j<Enter> :rightbelow new<CR>:terminal<CR>:startinsert<CR>

nnoremap <silent> <leader>df <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>tdf <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <leader>ref <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>doc <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> <leader>sym <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <leader>in <cmd>lua vim.lsp.buf.incoming_calls()<CR>
nnoremap <silent> <leader>out <cmd>lua vim.lsp.buf.outgoing_calls()<CR>
nnoremap <silent> <leader>h  <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>i  <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>re <cmd>lua vim.lsp.buf.rename()<CR>

imap <expr> <C-l>  vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>  vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

let g:lexima_no_default_rules = v:true
call lexima#set_default_rules()
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(lexima#expand('<LT>CR>', 'i'))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')

au FileType go nmap <leader>t  <Plug>(go-test)

au FileType fzf tunmap <Esc>
nnoremap <Leader>a :Buffers<CR>
nnoremap <Leader>; :Files<CR>
nnoremap <Leader>r :Rg <C-R><C-W><CR>
xnoremap <Leader>r y:Rg <C-R>"<CR>
nnoremap <Leader>c :BCommits<CR>

au TermOpen * tnoremap <Esc> <C-\><C-n>

