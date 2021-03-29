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

nnoremap <leader><c-h> :tabprevious<CR>
nnoremap <leader><c-l> :tabnext<CR>

" Remove highlights
map <C-h> :nohlsearch<CR>

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
Plug 'sainnhe/forest-night'

" Language Support
Plug 'sheerun/vim-polyglot'

" File Explorer
Plug 'preservim/nerdtree'

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

set termguicolors
let g:forest_night_enable_italic = 1
let g:forest_night_disable_italic_comment = 1
colorscheme forest-night

set nowrap
