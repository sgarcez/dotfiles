
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

" Remap escape keys to something usable on home row
inoremap jk <Esc>
cnoremap jk <C-C>
" inoremap <Esc> <Nop>
" cnoremap <Esc> <Nop>

" Save
nnoremap <Leader>w <Esc>:w<CR>

" Search and Replace
nnoremap sr :%s//g<Left><Left>
nnoremap <Leader>sr :%s/\<<C-r><C-w>\>//g<Left><Left>

" Universal closing behavior
nnoremap <silent><Leader>q :call CloseSplitOrDeleteBuffer()<CR>
nnoremap <silent>Q :call CloseSplitOrDeleteBuffer()<CR>
function! CloseSplitOrDeleteBuffer()
  if winnr('$') > 1
    wincmd c
  else
    execute 'bdelete'
  endif
endfunction

" Navigate buffers
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [t :tabprevious<CR>
nnoremap ]t :tabnext<CR>

" gitgutter
nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)

" Move around splits with ctrl + direction
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" If split in given direction exists - jump, else create new split
nnoremap <silent> <Leader>hh :leftabove vsplit<CR>
nnoremap <silent> <Leader>ll :rightbelow vsplit<CR>
nnoremap <silent> <Leader>kk :leftabove split<CR>
nnoremap <silent> <Leader>jj :rightbelow split<CR>

nnoremap <silent> <Leader>tt :tab split<CR>

" Opening splits with terminal in all directions
nnoremap <Leader>h<Enter> :leftabove  vnew<CR>:terminal<CR>:startinsert<CR>
nnoremap <Leader>l<Enter> :rightbelow vnew<CR>:terminal<CR>:startinsert<CR>
nnoremap <Leader>k<Enter> :leftabove  new<CR>:terminal<CR>:startinsert<CR>
nnoremap <Leader>j<Enter> :rightbelow new<CR>:terminal<CR>:startinsert<CR>

" 'neovim/nvim-lsp'
nnoremap <silent> <leader>df <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>h  <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>i  <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>td <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>

" 'hrsh7th/vim-vsnip'
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" 'haorenW1025/diagnostic-nvim'
" nnoremap <silent> <leader>d[ :PrevDiagnosticCycle<CR>
nnoremap <silent> ]d :NextDiagnostic<CR>
nnoremap <silent> [d :PrevDiagnostic<CR>
nnoremap <silent> <leader>do :OpenDiagnostic<CR>
" nnoremap <leader>dl <cmd>lua require'diagnostic.util'.show_line_diagnostics()<CR>
nnoremap <leader>dl <cmd> lua vim.lsp.util.show_line_diagnostics()<CR>

" 'haorenW1025/completion-nvim'
imap <c-j> <cmd>lua require'source'.prevCompletion()<CR> "use <c-j> to switch to previous completion
imap <c-k> <cmd>lua require'source'.nextCompletion()<CR> "use <c-k> to switch to next completion

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" 'fatih/vim-go'
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

au FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
au FileType go nmap <leader>t  <Plug>(go-test)
au FileType go nmap <leader>m :GoMetaLinter<CR> 

" 'junegunn/fzf.vim'
" Exit fzf list
au FileType fzf tunmap <Esc>
nnoremap <leader>; :Files<CR>
nnoremap <Leader>fr :Rg <C-R><C-W><CR>
xnoremap <Leader>fr y:Rg <C-R>"<CR>
nnoremap <Leader>fc  :BCommits<CR>
nnoremap <Leader>fb   :Buffers<CR>

" nnoremap <Leader>gd   :GFiles?<CR>
" nnoremap <Leader>f/  :Rg<CR>
" nnoremap <Leader>c  :Commands<CR>
" nnoremap <Leader>b   :Buffers<CR>
" nnoremap <Leader>gf   :GFiles?<CR>
" nnoremap <Leader>ff  :GFiles<CR>
" nnoremap <Leader>fF  :Files<CR>
" nnoremap <Leader>fL  :Lines<CR>
" nnoremap <Leader>fl  :BLines<CR>
" nnoremap <Leader>ft  :BTags<CR>
" nnoremap <Leader>fT  :Tags<CR>
" nnoremap <Leader>fc  :BCommits<CR>
" nnoremap <Leader>fC  :Commits<CR>
" nnoremap <Leader>fh  :History:<CR>
" nnoremap <Leader>fH  :History/<CR>
" nnoremap <Leader>fm  :Commands<CR>
" nnoremap <Leader>fo  :Locate<SPACE>
" nnoremap <Leader>fk  :Maps<CR>
" nnoremap <Leader>f/  :Rg<CR>

" 'kassio/neoterm'
au TermOpen * tnoremap <Esc> <C-\><C-n>
