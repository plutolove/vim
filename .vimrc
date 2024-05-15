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
        path: '/data01/home/mengshangqi.123/bin/clangd_15.0.6/bin/clangd',
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
# nnoremap <F5> :update<CR>:source %<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
set termguicolors
set background=dark
set encoding=UTF-8

# theme
colorscheme everforest
g:everforest_background = 'hard'

# status bar
g:airline_theme = 'everforest'

autocmd FileType c ClangFormatAutoEnable
autocmd FileType cpp ClangFormatAutoEnable

autocmd FileType python,shell,coffee set commentstring=#\ %s
autocmd FileType java,c,cpp set commentstring=//\ %s

# jump
nnoremap gd :LspGotoDefinition<CR>
# floatterm
g:floaterm_keymap_toggle = '<Leader>t'
# fuzzy
nnoremap <Leader>f :FuzzyGrep <C-R><C-W><CR>
