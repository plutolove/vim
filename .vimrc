vim9script

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

plug#end()

# clangd lsp
packadd lsp
lsp#options#OptionsSet({'showSignature': v:false})
var lspServers = [
    {
        filetype: ['c', 'cpp'],
        path: '/usr/bin/clangd',
        args: ['--log=verbose', '--pretty', '--all-scopes-completion', '--completion-style=detailed', '--header-insertion=iwyu', '-j=8', '--background-index', '--compile-commands-dir=build']
    }
]

g:LspAddServer(lspServers)

inoremap jj <esc>
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
nnoremap <C-t> :NERDTreeToggle<CR>
set termguicolors
set background=dark
set encoding=UTF-8
# set cinoptions=t0
set cindent
set autoindent
set sw=2
set ts=2
set smartindent

# theme
colorscheme everforest
g:everforest_background = 'soft'

# status bar
g:airline_theme = 'everforest'

#clang-format
autocmd FileType c ClangFormatAutoEnable
autocmd FileType cpp ClangFormatAutoEnable
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

autocmd FileType python,shell,coffee set commentstring=#\ %s
autocmd FileType java,c,cpp set commentstring=//\ %s

# jump
nnoremap gd :LspGotoDefinition<CR>
# floatterm
g:floaterm_keymap_toggle = '<Leader>t'

# search
nnoremap <esc> :noh<return><esc>
