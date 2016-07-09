"""""""""""""""""""""
" Generated options "
"""""""""""""""""""""
version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())
let &cpo=s:cpo_save
unlet s:cpo_save
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg
" vim: set ft=vim :

""""""""""""""""""""""
" Powerline settings "
""""""""""""""""""""""

set rtp+=/usr/lib/python3.5/site-packages/powerline/bindings/vim/
set laststatus=2
set showtabline=1
set noshowmode
set t_Co=256

"""""""""""
" General "
"""""""""""

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread



""""""""""""""""""""""
" Vim user interface "
""""""""""""""""""""""

" Turn on the wild menu
set wildmenu

" Show line numbers
set number

" Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Configure backspace, so it acts as expected
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" Try to be smart about cases when searching
set smartcase

" Highlight search results
set hlsearch

" Enable increment search
set incsearch

" Do not redraw while executing macros
set lazyredraw

" Show matching brackets when cursor is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

""""""""""""""""""""
" Colors and fonts "
""""""""""""""""""""

" Enable syntax highlighting
syntax enable

" Set utf-8 as standard encoding
set encoding=utf8

" Use UNIX as the standard file type
set ffs=unix,dos,mac
