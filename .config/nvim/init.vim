"   ██╗███╗   ██╗██╗████████╗██╗   ██╗██╗███╗   ███╗
"   ██║████╗  ██║██║╚══██╔══╝██║   ██║██║████╗ ████║
"   ██║██╔██╗ ██║██║   ██║   ██║   ██║██║██╔████╔██║
"   ██║██║╚██╗██║██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║
"   ██║██║ ╚████║██║   ██║██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
"   ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
"          a neovim configuration bysimeon

" plugins w/ vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug '/usr/local/opt/fzf' 
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'dylanaraps/wal.vim'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-ragtag'
Plug 'junegunn/goyo.vim'
" Plug 'mattn/emmet-vim'
" Plug 'vimwiki/vimwiki'
" Plug 'justinmk/vim-sneak'
" Plug 'machakann/vim-sandwich'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-abolish'
" Plug 'tpope/vim-commentary'
" Plug 'sheerun/vim-polyglot'
" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'
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

" switch tabs with ctrl left and right
nnoremap <C-right> :tabnext<CR>
nnoremap <C-left> :tabprevious<CR>
" and whilst in insert mode
inoremap <C-right> <Esc>:tabnext<CR>
inoremap <C-left> <Esc>:tabprevious<CR>

" use control + l to turn off highlighing
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L> 
endif

" appearence
colorscheme wal          " colorscheme for nvim and lighline

" basic settings
set number relativenumber " Use relative numberlines
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
set clipboard=unnamedplus " clipboard shared with system
syntax on                 " syntax highlighting
filetype plugin on

" html settings
autocmd FileType html setlocal shiftwidth=4 tabstop=4
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

" italic comments
let &t_ZH="\e[3m"   
let &t_ZR="\e[23m"
highlight Comment cterm=italic, gui=italic

"" PLUGIN CUSTOMIZATION ""

" lightline overwrite plugin name & uae wal colorscheme
let g:lightline = {
      \ 'colorscheme': 'wal',
      \ 'component_function': {
      \   'mode': 'LightlineMode'
      \ },
      \ }

function! LightlineMode()
  return expand('%:t') ==# '__Tagbar__' ? 'Tagbar':
        \ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
        \ &filetype ==# 'unite' ? 'Unite' :
        \ &filetype ==# 'vimfiler' ? 'VimFiler' :
        \ &filetype ==# 'vimshell' ? 'VimShell' :
        \ &filetype ==# 'nerdtree' ? 'NERD' :
        \ &filetype ==# 'NERD_tree_1' ? 'NERD' :
        \ lightline#mode()
endfunction

" deoplete on startup
let g:deoplete#enable_at_startup = 1

" emmet for html & css only
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall

" emmet change trigger key
" let g:user_emmet_leader_key='<C-M>'

" start nerdtree when nvim opened without file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" start nerdtree when nvim opens
" autocmd vimenter * NERDTree

" open nerdtree with ctrl + n
map <C-n> :NERDTreeToggle<CR>

" close nerdtree if it's the only thing left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" enable ncm2 for all buffer
" autocmd BufEnter * call ncm2#enable_for_buffer()

" note that must keep noinsert in completeopt, the others is optional
" set completeopt=noinsert,menuone,noselect
