set number
set relativenumber
syntax on
filetype on
filetype plugin indent on
:set tabstop=2
:set shiftwidth=2
:set expandtab
:set showmode
:set laststatus=2

let mapleader=" "

vnoremap <silent> <Leader>l :tabnext<CR>
vnoremap <silent> <Leader>h :tabprevious<CR>

" Tmux clipboard integration
if exists('$TMUX')
  " Copy to tmux clipboard on yank
  autocmd TextYankPost * if v:event.operator ==# 'y' | call system('tmux load-buffer -', @") | endif

  " Paste from tmux clipboard
  nnoremap <silent> <Leader>p :let @"=system('tmux save-buffer -')<CR>p
  vnoremap <silent> <Leader>p :<C-U>let @"=system('tmux save-buffer -')<CR>gvp
endif
