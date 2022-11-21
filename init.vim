" Vim configuration with as few plugins as possible



" Html auto complete tags
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags 

set relativenumber
set nowrap
set spell
set autoindent
set smartindent
set noexpandtab
set splitbelow
set cursorline
set termguicolors
set bg=dark
set clipboard=unnamedplus
set scrolloff=5
set sidescrolloff=10
set shiftwidth=2
set tabstop=2
set softtabstop=2
set laststatus=2
set encoding=utf-8
set updatetime=300
set signcolumn=yes
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:\_
set list
filetype plugin on
syntax on
filetype indent on

" Leader key
let g:mapleader=' '

" Personal remaps
inoremap jj <Esc>
tnoremap jj <C-\><C-n>
inoremap <leader>ff <Esc>:tabnew +Ex<Cr>
nnoremap <leader>ff :tabnew +Ex<Cr>
inoremap <leader>cc <C-X><C-O>

" Vim plug
call plug#begin()

Plug 'tabnine/YouCompleteMe', {'do': './install.py --all'} "We all know tabnine rocks
Plug 'mattn/emmet-vim' "Html without emmet is like hamburger without ham
Plug 'morhetz/gruvbox' "My favourite theme
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Who doesn't use coc these days??
Plug 'github/copilot.vim' "Its copilotttttttt
" Coc plugins I use: coc-tsserver, coc-prettier

call plug#end()

" Gruvbox theme
"autocmd vimenter * ++nested colorscheme gruvbox
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_transparent_bg=1
colorscheme gruvbox
""hi! Normal ctermbg=NONE guibg=NONE
""hi! NonText ctermbg=NONE guibg=NONE

" A specific node version for copilot
let g:copilot_node_command = "~/.nodenv/versions/16.15.0/bin/node"

" Emmet
let g:emmet_leader_key = '<C-,>'










