
"              ██
"              ▀▀
" ██▄  ▄██   ████     ████▄██▄
"  ██  ██      ██     ██ ██ ██
"  ▀█▄▄█▀      ██     ██ ██ ██
"   ████    ▄▄▄██▄▄▄  ██ ██ ██
"    ▀▀     ▀▀▀▀▀▀▀▀  ▀▀ ▀▀ ▀▀


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/f0x/.dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/f0x/.dein')
  call dein#begin('/home/f0x/.dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/f0x/.dein/repos/github.com/Shougo/dein.vim')

  " Plugins
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('jlanzarotta/bufexplorer')
  call dein#add('junegunn/fzf')
  call dein#add('junegunn/goyo.vim')
  call dein#add('itchyny/lightline.vim')

  " Syntax
  call dein#add('cespare/vim-toml')
  call dein#add('vim-perl/vim-perl6')
  call dein#add('bitc/vim-bad-whitespace')

  " Colorschemes
  " call dein#add('f0x52/vim-hybrid-material')
  call dein#add('arcticicestudio/nord-vim')

  " You can specify revision/branch/tag.
  "call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

set background=dark
set number
set tabstop=4
set shiftwidth=4
set expandtab
set termguicolors
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

imap <PageUp> <Home>
imap <PageDown> <End>

"tnoremap <Esc> <C-\><C-n>

"colorscheme hybrid_material
"colorscheme hybrid_reverse
let g:nord_comment_brightness = 20
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }
colorscheme nord

