
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
  call dein#add('junegunn/limelight.vim')
  call dein#add('itchyny/lightline.vim')
  "call dein#add('ying17zi/vim-live-latex-preview')

  " Syntax
  call dein#add('cespare/vim-toml')
  call dein#add('vim-perl/vim-perl6')
  call dein#add('fatih/vim-go')
  call dein#add('pangloss/vim-javascript')
  call dein#add('mxw/vim-jsx')
  call dein#add('lervag/vimtex')

  call dein#add('neomake/neomake')
  "call dein#add('bitc/vim-bad-whitespace')
  "call dein#add('lervag/vimtex')

  " Colorschemes
  call dein#add('chriskempson/base16-vim')
  call dein#add('jrolfs/vim-base16-lightline')
  call dein#add('kristijanhusak/vim-hybrid-material')
  "call dein#add('morhetz/gruvbox')
  "call dein#add('shinchu/lightline-gruvbox.vim')

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
set tabstop=2
set shiftwidth=2
set expandtab
set termguicolors
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor


set textwidth=80
"set colorcolumn=+1

imap <PageUp> <Home>
imap <PageDown> <End>

map <M-Left> :bp 
map <M-Right> :bn 

"tnoremap <Esc> <C-\><C-n>

"colorscheme hybrid_material
"colorscheme hybrid_reverse
"let g:nord_comment_brightness = 20
let g:gruvbox_contrast_dark = 'hard'
let g:goyo_width = '80%'
let g:latex_view_general_viewer = 'zathura'
let g:neomake_javascript_enabled_makers = ['eslint']

nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>c :lclose<CR>     " close location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning

" When writing a buffer (no delay).
call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 450)

set noshowmode
let g:lightline = {
      \ 'colorscheme': 'base16',
      \ }
function! s:goyo_leave()
    q
endfunction

autocmd! User GoyoLeave nested call <SID>goyo_leave()

"colorscheme base16-ocean
colorscheme hybrid_reverse
