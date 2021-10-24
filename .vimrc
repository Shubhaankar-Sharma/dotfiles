set nocompatible              " be iMproved, required
filetype off                  " required


let python_highlight_all=1

"vim plug auto install

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'kevinhui/vim-docker-tools'
"Plug 'powerline/powerline'
"Plug 'rstacruz/sparkup', {'rtp': 'vim/'} "html support
Plug 'fatih/vim-go' "golang server 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "fuzzy finder
Plug 'preservim/nerdtree' "file system
Plug 'frazrepo/vim-rainbow' "coloured brakcets

"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

Plug 'zxqfl/tabnine-vim' "autocomplete
Plug 'editorconfig/editorconfig-vim'
Plug 'dense-analysis/ale'
"Plug 'hugolgst/vimsence' "discord rich presence 

"themes
Plug 'morhetz/gruvbox'
Plug 'sainnhe/edge'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'arcticicestudio/nord-vim', { 'for': 'go' }
Plug 'jacoborus/tender.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jcherven/jummidark.vim'
Plug 'artanikin/vim-synthwave84'
Plug 'victorze/foo'

"Plug 'vim-scripts/vim-gitgutter'

Plug 'airblade/vim-gitgutter'
Plug 'voldikss/vim-floaterm'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
"Plug 'cjrh/vim-conda' "annaconda

call plug#end()            " required

set rtp+=$GOROOT/misc/vim
filetype plugin indent on    " required

"nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"floatterm
nnoremap <leader>f :FloatermNew<CR>
nnoremap <leader>h :FloattermHide<CR>
nnoremap <leader>k :FloattermKill<CR>


"background

syntax on
syntax enable
set encoding=utf-8
set ruler
set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
set autoindent                              " indent when moving to the next line while writing cod
set showmatch

set background=dark
"THEMES=======================================
"colorscheme default
"colorscheme nord
colorscheme gruvbox
"colorscheme palenight
"colorscheme dracula
"colorscheme jummidark
"colorscheme synthwave84
"colorscheme hacker 
"colorscheme hyper
"============================================

set termguicolors
let g:indentLine_setColors = 0

let g:rainbow_active = 1

set t_Co=256
"set background=dark

"map <F4> :CondaChangeEnv<CR>

"opacity =======================================
"comment it out if terminal emulator does not have opacity
highlight nonText    ctermbg=NONE guibg=NONE
highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
"===============================================

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
set number
let g:NERDTreeGitStatusWithFlags = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


"go===================================================
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)

"nnoremap <buffer> <leader> t :call GoTest(./...)<CR>
au FileType go nmap <leader>c <Plug>(go-coverage ./...)
let g:go_def_mapping_enabled = 0
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
"=====================================================

"coc ====================


"airline================================================

"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline#extensions#tabline#enabled = 1
"function! GitStatus()
 "let [a,m,r] = GitGutterGetHunkSummary()
    "return printf('+%d ~%d -%d', a, m, r)
"endfunction
"set statusline+=%{GitStatus()}
"set signcolumn=yes
"highlight link GitGutterChangeLine DiffText
"=======================================================


"powerline===============================================
set guifont=Liberation\ Mono\ for\ Powerline\ 10 
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1

"let g:airline_theme='edge'
"let g:airline_theme='palenight'
"let g:airline_theme='gruvbox'
"let g:airline_theme='nord'
"let g:airline_theme='dracula'
"let g:airline_theme='jummidark'
"let g:airline_theme='distinguished'
let g:airline_theme='synthwave84'


let g:airline#extensions#hunks#enabled=0
let g:gitgutter_diff_base = 'master'
" unicode symbols 
"let g:airline#extensions#branch#enabled=1
"========================================================

set clipboard=unnamedplus
