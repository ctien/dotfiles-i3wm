call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'christoomey/vim-tmux-navigator' "navigator vim
Plug 'maxmellon/vim-jsx-pretty'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:gruvbox_contrast_dark='hard'

let mapleader="\<space>"
let g:fzf_layout = { 'down': '30%' }

colorscheme gruvbox

set t_Co=256
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab

set number
set relativenumber
set numberwidth=2
set clipboard^=unnamed,unnamedplus       " Share clipboard between Vim and OS, across platform

map <F2> :NERDTreeToggle<CR>

nnoremap <Leader>f :Files<CR>
nnoremap <Leader>w :w<CR>

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <Leader>z :ZoomToggle<CR>
