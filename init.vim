" Config for first use
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim 
            \ --create-dirs 
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('$HOME/.config/nvim/plugged')
Plug 'sonph/onehalf', { 'rtp': 'vim'}
Plug 'ajmwagar/vim-deus'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'luochen1990/rainbow'
Plug 'ryanoasis/vim-devicons'
Plug 'gcmt/wildfire.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
call plug#end()
 
syntax enable 
filetype on 
set t_Co=256
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark    " Setting dark mode
let g:deus_termcolors=256
colorscheme deus  
let g:airline_theme='onehalfdark' 
let g:rainbow_active=1 
highlight Normal guibg=NONE, ctermbg=NONE 
highlight LineNr ctermbg=NONE 
highlight VertSplit ctermbg=NONE

set encoding=UTF-8
set autochdir
set hlsearch
nohlsearch
set noerrorbells
set novisualbell
set number
set relativenumber
set ruler
set wrap
set cursorline
set mouse=a
set scrolloff=10
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set incsearch
set ignorecase
set showmatch
set smartcase
set lazyredraw
set splitright
set splitbelow
set shortmess+=c
set noshowmode
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
    set undofile
    set undodir=$HOME/.config/nvim/tmp/undo,.
endif
set virtualedit=block
set hidden
set updatetime=300
set shortmess+=c

let mapleader=" "

noremap <silent> J 5j
noremap <silent> K 5k
noremap <silent> H ^
noremap <silent> L $
noremap <silent> \v v$h
noremap <C-K> 5<C-y>
noremap <C-J> 5<C-e>
nnoremap ; :
nnoremap Q :q<CR>
nnoremap S :w<CR>
nnoremap R :<C-u>source $MYVIMRC<CR>

noremap <LEADER>w <C-w>w
noremap <LEADER>j <C-w>j
noremap <LEADER>k <C-w>k
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l
noremap <LEADER>o <C-w>o
noremap <Up> :resize +5<CR>
noremap <Down> :resize -5<CR>
noremap <Left> :vertical resize -5<CR>
noremap <Right> :vertical resize +5<CR>

inoremap <C-a> <ESC>A

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-w> <S-Right>

" COC configuration
let g:coc_global_extensions = [
            \'coc-json', 
            \'coc-vimlsp', 
            \'coc-pyright', 
            \'coc-actions', 
            \'coc-explorer'
            \]

" Use <TAB> and <S-TAB> to select
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) : 
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <CR> to confirm
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <C-o> to active completion
inoremap <silent><expr> <C-o> coc#refresh()

nmap <silent> <space>- <Plug>(coc-diagnostic-prev)
nmap <silent> <space>= <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <LEADER>h to show documentation
nnoremap <silent> <LEADER>h :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)

function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)w

