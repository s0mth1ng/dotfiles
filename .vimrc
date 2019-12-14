call plug#begin()

Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'
Plug 'Chiel92/vim-autoformat'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'

call plug#end()

let g:ycm_global_ycm_extra_conf="~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_completion=1
let b:formatdef_custom_c='"clang-format"'
let b:formatters_c = ['custom_c']
let b:formatters_cpp = ['custom_c']
set backspace=2
set relativenumber
set termguicolors
syntax on
set background=dark
colorscheme nord
colorscheme peachpuff
highlight Comment ctermfg=green
highlight Search ctermfg=black
set hlsearch
set ruler
set foldenable
set foldlevel=100
set foldmethod=indent
set autoindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smartindent
filetype plugin on
set noswapfile 
map <C-n> :NERDTreeToggle<CR>
nmap <F2> :let @+=expand("%:p")<CR>
noremap <F3> :Autoformat<CR>
map <F4> :<C-U>!g++ -O2 -DLOCAL -std=c++11 -Wall -Wextra -Wno-unused-result %:r.cpp -o %:r<CR>
" map <F4> :<C-U>!gcc -fsanitize=address -Wall -Wextra  %:r.c -o %:r -lm <CR>
map <F5> :<C-U>!./%:r<CR>
map <F6> :<C-U>!./%:r < in.txt<CR>
map <F7> :<C-U>!autopep8 --in-place --aggressive %:r.py<CR>
map <F8> :<C-U>!python3 %:r.py<CR>
