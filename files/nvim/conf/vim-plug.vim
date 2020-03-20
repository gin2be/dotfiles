call plug#begin(stdpath('data') . '/plugged')

" base
Plug 'junegunn/vim-plug'
Plug 'Shougo/vimproc.vim', {'do': 'make'}

" ide
Plug 'w0ng/vim-hybrid'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'kassio/neoterm'
Plug 'junegunn/fzf', { 'do': './install --bin --xdg' }
Plug 'junegunn/fzf.vim'

" text
Plug 'tpope/vim-surround'

" completions
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}

" langs
Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim'
Plug 'tpope/vim-markdown'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'

" snippet
Plug 'ncm2/ncm2-neosnippet'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" others
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

let s:plugs = {'plugs': get(g:, 'plugs', {})}
function! s:plugs.is_installed(name)
  return has_key(self.plugs, a:name) ? isdirectory(self.plugs[a:name].dir) : 0
endfunction

" plugin configs
if s:plugs.is_installed('nerdtree')
  nnoremap <silent><F3> :NERDTreeToggle<CR>
endif

if s:plugs.is_installed('vim-hybrid')
  set background=dark
  colorscheme hybrid
endif

if s:plugs.is_installed('ncm2')
  autocmd BufEnter * call ncm2#enable_for_buffer()
  set completeopt=noinsert,menuone,noselect
endif

if s:plugs.is_installed('neosnippet.vim')
  imap <C-k> <Plug>(neosnippet_expand_or_jump)
  smap <C-k> <Plug>(neosnippet_expand_or_jump)
  xmap <C-k> <Plug>(neosnippet_expand_target)
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
endif

if s:plugs.is_installed('LanguageClient-neovim')
  nnoremap <F5> :call LanguageClient_contextMenu()<CR>
  nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

  let g:LanguageClient_serverCommands = {
        \ 'go': ['gopls'],
        \ 'javascript': ['javascript-typescript-stdio'],
        \ 'typescript': ['javascript-typescript-stdio'],
        \ 'javascript.jsx': ['javascript-typescript-stdio'],
        \ 'typescript.tsx': ['javascript-typescript-stdio']
        \ }
  let g:LanguageClient_rootMarkers = {
        \ 'javascript': ['jsconfig.json'],
        \ 'typescript': ['tsconfig.json']
        \ }
endif

if s:plugs.is_installed('neoterm')
  let g:neoterm_default_mod = 'rightbelow'
  let g:neoterm_size = 10

  nnoremap <c-t><c-t> :Ttoggle<CR><C-w>j
  tnoremap <c-t><c-t> <C-\><C-n>:Ttoggle<CR>
  tnoremap <silent> <ESC> <C-\><C-n>
endif

if s:plugs.is_installed('vim-markdown')
  let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'json']
  let g:markdown_minlines = 100
endif

if s:plugs.is_installed('vim-gitgutter')
  let g:gitgutter_sign_added = '+'
  let g:gitgutter_sign_modified = '~'
  let g:gitgutter_sign_removed = '-'
  nmap ]h <Plug>(GitGutterNextHunk)
  nmap [h <Plug>(GitGutterPrevHunk)
endif

if s:plugs.is_installed('vim-go')
  map <C-n> :cnext<CR>
  map <C-m> :cprevious<CR>
  nnoremap <leader>a :cclose<CR>
endif
