" Vim configuration file - Emilio

" Use Vim settings, rather than Vi
" This must be first, because it changes other options as a side effect.
set nocompatible

" Set line numbers
set number

" Set automatic identation
set smartindent
filetype plugin indent on

" ---- Quasi fuzzy search ----
" Search down into subfolders for files
" Provides tab-completion for all file-related tasks
set path+=**
" Display all matching files when we tab complete
set wildmenu
" Things to consider:
" :b lets you autocomplete any open buffer

" ---- Tag jumping ----
" Create the 'tags' file
:command MakeTags !ctags -R .
" Now we can :
" Ctrl + ] jump to tag under cursor
" g + Ctrl + ] for ambiguous tags
" Ctrl + t jump back up the tag stack

" Tab configuration
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab
" Define lines width to 80
" For applying the format select a line and execute 'gq'
set textwidth=80

" Show tabs and spaces with special chars
" For showing them, but better use a command
"set list
set listchars=tab:░░,space:␣
" For not showing tabs with special chars, but better use a command
" set nolist

" ---- Autocomplete ----
" ^x^n just this file
" ^x^f just for file names
" ^x^] for tags

" ---- Windows management ----
" Ctrl-w + o   Maximize current screen
" Ctrl-w + ^   Add again a minimized window

" ---- Avoid using ESC for going to normal mode ----
" Basically just use the normal mode commands with Alt, ex.
" Alt-o      Opens a new line below
" Alt-A      Appends to the end of current line
" Alt-p      Pasters at the current insertion location
" Alt-k      Moves up one line

" ---- File browsing ----
let g:netrw_banner=0         "disable annoying banner
let g:netrw_browser_split=4  "open in prior window with 't'
let g:netrw_altv=1           "open splits to the right with 'v'
let g:netrw_liststyle=3      "tree view
" These last two options do not work in bash for windows
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" ---- Set colors ----
syntax on
" Enable more than just the 8 basic colors
set t_Co=256
colorscheme desert

" For hightlighting the actual line where the cursor is
set cursorline
highlight CursorLine cterm=none ctermbg=235
"highlight Cursor ctermbg=Green
"highlight iCursor guifg=white guibg=steelblue
"set guicursor=n-v-c:block-Cursor
"set guicursor+=i:ver100-iCursor
"set guicursor+=n-v-c:blinkon0
"set guicursor+=i:blinkwait10

" Highlights a search. To stop highlighting do :noh
set hlsearch
" Change colour of font when in search function
"hi Search ctermfg=White ctermbg=Black

" Remaping Ctrl+s to save the document
:nmap <C-s> :w!<cr>
:imap <C-s> <esc>:w!<cr>
" Remaping to system's clipboard Ctrl+c and Ctrl+v
vnoremap <C-c> "+y
vnoremap <C-v> "+p
" Remaping Enter and Shitf+Enter for inserting a new line in normal mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
" ---- Commands ----
" Convert to linux line endings
:command EndingsLinux %s///g
" Delete trailing spaces
:command Trial %s/\s\+$//
" Simplify grep
:command -nargs=1 Grep grep -rn <q-args> .
" Show spaces and tabs
:command ShowTabs set list
" Show no special chars
:command ShowNoTabs set nolist

