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

" langs

" snippet

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

if s:plugs.is_installed('neoterm')
  let g:neoterm_default_mod = 'rightbelow'
  let g:neoterm_size = 10

  nnoremap <c-t><c-t> :Ttoggle<CR><C-w>j
  tnoremap <c-t><c-t> <C-\><C-n>:Ttoggle<CR>
  tnoremap <silent> <ESC> <C-\><C-n>
endif

if s:plugs.is_installed('vim-gitgutter')
  let g:gitgutter_sign_added = '+'
  let g:gitgutter_sign_modified = '~'
  let g:gitgutter_sign_removed = '-'
  nmap ]h <Plug>(GitGutterNextHunk)
  nmap [h <Plug>(GitGutterPrevHunk)
endif
