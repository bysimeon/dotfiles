" a neovim configuration bysimeon

" plugins w/ vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug '/usr/local/opt/fzf' 
Plug 'itchyny/lightline.vim'
Plug 'dylanaraps/wal.vim'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'tpope/ragtag.vim'
Plug 'w0rp/ale'
call plug#end()

" keybindings
let mapleader="\<SPACE>" " Change map leader to space.
:nnoremap ; :
:nnoremap Q @q

if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L> 
endif

" appearence
colorscheme wal          " colorscheme for nvim and lighline
let g:lightline = {   
      \ 'colorscheme': 'wal',
      \ }

" basic settings
set showmatch            " Show matching brackets.
set number               " Show the line numbers on the left side.
set formatoptions+=o     " Continue comment marker in new lines.
set expandtab            " Insert spaces when TAB is pressed.
set tabstop=4            " Render TABs using this many spaces.
set shiftwidth=4         " Indentation amount for < and > commands.
set noshowmode           " hides the insert text at the bottom
set updatetime=100       " faster update time for nvim
set autoindent           " auto indent

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

