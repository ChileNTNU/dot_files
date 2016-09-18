" Vim configuration file - Emilio

" Set colors 
syntax on
colorscheme elflord

" Set line numbers
set number

set smartindent
filetype plugin indent on

" Tab configuration
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab

"set cursorline
"highlight Cursor guifg=white guibg=white
"highlight Cursor ctermbg=Green
"highlight iCursor guifg=white guibg=steelblue
"set guicursor=n-v-c:block-Cursor
"set guicursor+=i:ver100-iCursor
"set guicursor+=n-v-c:blinkon0
"set guicursor+=i:blinkwait10

" Highlights a search. To stop highlighting do :noh
"set hlsearch

" Commands
" Delete trailing spaces
:command Trial %s/\s\+$//
