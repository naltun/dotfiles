""""""""""""""""
" Misc.
""""""""""""""""
set autoindent
set encoding=utf-8
set mouse=r
set number numberwidth=4
set tabstop=4 shiftwidth=4 expandtab
set wildmenu
set wrap
set colorcolumn=100

""""""""""""""""
" Variables
""""""""""""""""

let mapleader = ','
let maplocalleader = "\\" 

""""""""""""""""
" Mappings
""""""""""""""""

" Delete current line
noremap <leader><c-d> dd
inoremap <leader><c-d> <esc>ddi

" Delete current word
noremap <leader><c-d>w diw

" Undo last edit
noremap <leader><c-z> u
inoremap <leader><c-u> <esc>ui

" Move current line down one
noremap <leader>- ddjP

" Move current line up one
noremap <leader>_ ddkP

" Uppercase text
nnoremap <leader><c-u> <esc>viwU<esc>n
vnoremap <leader><c-u> U
inoremap <leader><c-u> <esc>viwU<esc>i

nnoremap <leader>h :tabprevious<CR>
nnoremap <leader>l :tabnext<CR>

" Remove highlights
map <leader>H :nohlsearch<CR>

" Open new tab
noremap <leader>t :tabnew<CR>

" telescope for file fuzzy finding
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

"""""""""""""""
" Automatic Commands
"""""""""""""""

" Lint then overwrite JSON files if `jsonlint' CLI is executable
if executable('jsonlint')
    autocmd BufWrite *.json silent !jsonlint --in-place %
endif

""""""""""""""""
" Plugs
""""""""""""""""

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

    Plug 'https://gitlab.com/code-stats/code-stats-vim.git'
    Plug 'vim-airline/vim-airline'
    Plug 'APZelos/blamer.nvim'

    " Themes
    Plug 'sainnhe/everforest'

    " Language Support
    Plug 'sheerun/vim-polyglot'

    " File Explorer
    Plug 'preservim/nerdtree'

    " telescope.nvim
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'


call plug#end()

""""""""""""""""
" Plugs Configuration
""""""""""""""""

" CodeStats
" let g:codestats_api_key = ''

" Airline
let g:airline_section_x = airline#section#create_right(['tagbar', 'filetype', '%{CodeStatsXp()}'])

" Blamer
let g:blamer_delay = 500
let g:blamer_enabled = 0
let g:blamer_template = '<author>, <committer-time> • <summary>'
map <C-s> :BlamerToggle<CR>

" NERDTree
let NERDTreeMinimalUI = 1
let g:nerdtree_open = 0
map <C-n> :NERDTreeToggle<CR>

""""""""""""""""
" Syntax and theme
""""""""""""""""

if has('termguicolors')
    set termguicolors
endif
set background=dark

let g:everforest_background = 'soft'
let g:everforest_disable_italic_comment = 1

colorscheme everforest
let g:airline_theme = 'everforest'

set nowrap
