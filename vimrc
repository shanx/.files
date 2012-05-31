filetype off  "Required for initializing Vundle
set nocompatible

" Commands are only available from VIM 7.3+
if v:version >= 703
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    " let Vundle manage Vundle
    " required! 
    Bundle 'gmarik/vundle'

    Bundle 'L9'
    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'scrooloose/nerdtree'
    Bundle 'mileszs/ack.vim'
    Bundle 'wincent/Command-T'
    Bundle 'msanders/snipmate.vim'
    Bundle 'FuzzyFinder'
    Bundle 'kchmck/vim-coffee-script'
    Bundle 'tpope/vim-fugitive'
    Bundle 'tpope/vim-surround'
    Bundle 'pangloss/vim-javascript'
    Bundle 'godlygeek/tabular'
    Bundle 'hallettj/jslint.vim'
    Bundle 'manalang/jshint.vim'
    Bundle 'scrooloose/nerdcommenter'
endif

"Turn on smart indent
set smartindent
set tabstop=4 "set tab character to 4 characters
set expandtab "turn tabs into whitespace
set shiftwidth=4 "indent width for autoindent
filetype indent on "indent depends on filetype

"Turn on incremental search with ignore case (except explicit caps)
set incsearch
set smartcase

"Enable syntax highlighting and line numbers
syntax enable
set nu

"Set 256 colors and colorscheme / font
set t_Co=256
colorscheme xoria256

" Option for MacVim font
set guifont=Bitstream\ Vera\ Sans\ Mono:h14

"Show non space special chars
"set list

"Highlight line cursor is on
set cursorline

set ruler
set showmatch

" Set tab completion options
set wildmenu
set wildmode=list:longest,full

" Allow vim to write to local system clipboard on mac
set clipboard=unnamed

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
"set listchars=tab:▸\ ,eol:¬

" Allow to use mouse to point and click at help tags
if v:version >= 702
    set mouse=a
endif
