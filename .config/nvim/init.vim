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
Plug 'maximbaz/lightline-ale'
Plug 'dylanaraps/wal.vim'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'tpope/vim-ragtag'
Plug 'junegunn/goyo.vim'
Plug 'sbdchd/neoformat'
Plug 'chemzqm/vim-jsx-improve'
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'skywind3000/asyncrun.vim'
Plug 'wakatime/vim-wakatime'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'Yggdroot/indentLine'
Plug 'nerdypepper/agila.vim'
Plug 'neoclide/coc.nvim', {'do': './install.sh'}
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Plug 'scrooloose/nerdtree'
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
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

" APPEARANCE

" vim-startify custom header
let g:startify_custom_header =  ["..."]

" indent characters
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

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
colorscheme agila          " colorscheme for nvim and lighline

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

" map <esc> to exit terminal-mode
:tnoremap <Esc> <C-\><C-n><Paste>

"" PLUGIN CUSTOMIZATION ""

" lightline overwrite plugin name & use wal colorscheme
let g:lightline = {
      \ 'colorscheme': 'wal',
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
      \   'mode': 'LightlineMode'
      \ },
      \ }
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \  'buffers': 'lightline#bufferline#buffers',
      \ }
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close', 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok']]}
let g:lightline.component_type   = {'buffers': 'tabsel'}

function! LightlineMode()
  return expand('%:t') ==# '__Tagbar__' ? 'Tagbar':
        \ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
        \ &filetype ==# 'unite' ? 'Unite' :
        \ &filetype ==# 'vimfiler' ? 'VimFiler' :
        \ &filetype ==# 'vimshell' ? 'VimShell' :
        \ &filetype ==# 'nerdtree' ? 'NERD' :
        \ &filetype ==# 'NERD_tree_1' ? 'NERD' :
        \ &filetype ==# 'defx' ? 'Files' :
                \ lightline#mode()
endfunction

" update lightline with new buffer
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

" deoplete on startup
" let g:deoplete#enable_at_startup = 1

" deoplete tab through options
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" coc.nvim configuration
" coc use tab for trigger completion
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" coc close the preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" coc correct syntax highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

" Use C to open coc config
call SetupCommandAbbrs('C', 'CocConfig')

" ale settings
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let b:ale_fixers = ['prettier', 'eslint'] " fix files with prettier, and then eslint
let g:ale_sign_column_always = 1 " keep the sign gutter open at all times 
let g:ale_fix_on_save = 1 " fix files with ale on save

let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" run prettier when file is saved
" autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

" emmet for html & css only
let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall

" emmet change trigger key
let g:user_emmet_leader_key='<C-M>'

" emmet settings
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
" vim-javascript enable flow
let g:javascript_plugin_flow = 1

" vim-jsx remove .jsx extension requirment
let g:jsx_ext_required = 0

" Defx
call defx#custom#option('_', {
	\ 'columns': 'indent:git:icons:filename',
	\ 'winwidth': 30,
	\ 'split': 'vertical',
	\ 'direction': 'topleft',
	\ 'show_ignored_files': 0,
	\ })

" start nerdtree when nvim opened without file
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" start nerdtree when nvim opens
" autocmd vimenter * NERDTree

" open nerdtree with ctrl + n
" map <C-n> :NERDTreeToggle<CR>

" close nerdtree if it's the only thing left
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" enable ncm2 for all buffer
" autocmd BufEnter * call ncm2#enable_for_buffer()

" note that must keep noinsert in completeopt, the others is optional
" set completeopt=noinsert,menuone,noselect
