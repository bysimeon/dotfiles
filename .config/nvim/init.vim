" a neovim configuration bysimeon

" plugins w/ vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug '/usr/local/opt/fzf' 
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'dylanaraps/wal.vim'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'justinmk/vim-sneak'
Plug 'ajh17/vimcompletesme'
Plug 'machakann/vim-sandwich'
call plug#end()

" KEYBINDINGS

" change map leader to space
let mapleader="\<SPACE>" 

" remap semicolon to colon
:nnoremap ; :

" remap Q to macro
:nnoremap Q @q

" remap split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" use control + l to turn off highlighing
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L> 
endif

" appearence
colorscheme wal          " colorscheme for nvim and lighline
let g:lightline = {   
      \ 'colorscheme': 'wal',
      \ }

" basic settings
set showmatch             " Show matching brackets.
set number                " Show the line numbers on the left side.
set formatoptions+=o      " Continue comment marker in new lines.
set expandtab             " Insert spaces when TAB is pressed.
set tabstop=4             " Render TABs using this many spaces.
set shiftwidth=4          " Indentation amount for < and > commands.
set noshowmode            " hides the insert text at the bottom
set updatetime=100        " faster update time for nvim
set autoindent            " auto indent
set autoread              " auto read files
set clipboard=unnamedplus " clipcoard shared with system
filetype plugin on

" html settings
autocmd FileType html setlocal shiftwidth=2 tabstop=2
" css settings
autocmd FileType css setlocal shiftwidth=2 tabstop=2
" scss settings
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
" javascript settings
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>


"" PLUGIN CUSTOMIZATION ""

" emmet for html & css only
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" start nerdtree when nvim opened without file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" start nerdtree when nvim opens
" autocmd vimenter * NERDTree

" open nerdtree with ctrl + n
map <C-n> :NERDTreeToggle<CR>

" close nerdtree if it's the only thing left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

