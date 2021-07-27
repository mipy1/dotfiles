set number
syntax on
set tabstop=4
set autoindent
set softtabstop=4
set mouse=a


call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'michaeljsmith/vim-indent-object'



Plug 'vim-syntastic/syntastic'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'arcticicestudio/nord-vim'

Plug 'rust-lang/rust.vim'
Plug 'Valloric/YouCompleteMe'

call plug#end()

" Vim Syntastic Config.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0



" Vim Airline Config.
let g:airline#extensions#tabline#enabled = 1
