call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'tomtom/tcomment_vim'
Plug 'Chiel92/vim-autoformat'

call plug#end()

let g:gruvbox_italic = 1
let g:formatdef_my_custom_cs = '"clang-format --style=\"{BasedOnStyle: Chromium, IndentWidth: 4}\""'
let g:formatdef_my_custom_py = '"autopep8 --in-place --aggressive"'
let g:formatters_cpp = ['my_custom_cs']
let g:formatters_c = ['my_custom_cs']
let g:formatters_py = ['my_custom_py']

set background=dark
colorscheme gruvbox
set number
syntax on
set autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smartindent
set cursorline
filetype plugin on
set noswapfile
nmap <F1> :let @+=expand("%:p")<CR>
map <F2> :<C-U>!python3 %:r.py<CR>
noremap <F3> :Autoformat<CR>
" map <F4> :<C-U>!g++ -O2 -DLOCAL -std=c++17 -Wall -Wextra -Wno-unused-result %:r.cpp -o %:r<CR>
map <F4> :<C-U>!gcc -fsanitize=address -Wall -Wextra  %:r.c -o %:r -lm <CR>
map <F5> :<C-U>!./%:r<CR>
