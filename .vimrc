vim9script
language messages en_US.utf-8

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rhysd/vim-clang-format'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'voldikss/vim-floaterm'
Plug 'Donaldttt/fuzzyy'
Plug 'sheerun/vim-polyglot'
Plug 'sainnhe/everforest'
Plug 'ryanoasis/vim-devicons'
Plug 'yegappan/lsp'
Plug 'easymotion/vim-easymotion'

plug#end()

# inoremap jj <esc>
syntax on
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
set number
set relativenumber
set cursorline
set cursorcolumn
set nobackup
set scrolloff=10
set nowrap
set incsearch
set smartcase
set hlsearch
set showmatch
set backspace=2
set nocompatible
set termguicolors
set background=dark
set encoding=UTF-8
set clipboard^=unnamed,unnamedplus

set nobackup
set noswapfile
set nowritebackup
set noundofile
# set cindent
# set autoindent
# set sw=2
# set ts=2
# set smartindent

autocmd FileType c ClangFormatAutoEnable
autocmd FileType cpp ClangFormatAutoEnable
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

autocmd FileType python,shell,coffee set commentstring=#\ %s
autocmd FileType java,c,cpp set commentstring=//\ %s

# nerdtree
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

# floatterm
g:floaterm_keymap_toggle = '<Leader>t'
tnoremap <Esc> <C-\><C-n>

# search
nnoremap <esc> :noh<return><esc>


# clangd lsp
autocmd VimEnter * g:LspOptionsSet({'showSignature': v:false})
var lspServers = [
    {
        filetype: ['c', 'cpp'],
        path: '/usr/bin/clangd',
        args: ['--log=verbose', '--pretty', '--all-scopes-completion', '--completion-style=detailed', '--header-insertion=iwyu', '-j=8', '--background-index', '--compile-commands-dir=build']
    }
]
autocmd VimEnter * g:LspAddServer(lspServers)
nnoremap gd :LspGotoDefinition<CR>
nnoremap pd :LspPeekDefinition<CR>
nnoremap <Leader>ca :LspCodeAction<CR>


# easy motion
g:EasyMotion_smartcase = 1
nmap <Leader>f <Plug>(easymotion-overwin-f2)
# s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f)
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
map <Leader><Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader><Leader>l <Plug>(easymotion-overwin-line)
# Move to line
# map <Leader>L <Plug>(easymotion-bd-jk)
# nmap <Leader>L <Plug>(easymotion-overwin-line)

nmap <Leader>l <Plug>(easymotion-lineforward)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)
nmap <Leader>h <Plug>(easymotion-linebackward)

# theme
g:everforest_background = 'soft'
# status bar
g:airline_theme = 'everforest'
autocmd VimEnter * colorscheme everforest
# packadd lsp
# lsp#options#OptionsSet({'showSignature': v:false})
# var lspServers = [
#     {
#         filetype: ['c', 'cpp'],
#         path: '/usr/bin/clangd',
#         args: ['--log=verbose', '--pretty', '--all-scopes-completion', '--completion-style=detailed', '--header-insertion=iwyu', '-j=8', '--background-index', '--compile-commands-dir=build']
#     }
# ]
# g:LspAddServer(lspServers)
# nnoremap gd :LspGotoDefinition<CR>
# nnoremap pd :LspPeekDefinition<CR>
# nnoremap <Leader>ca :LspCodeAction<CR>
