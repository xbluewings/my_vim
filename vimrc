filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

"----------------------------------------------------------
set nocompatible
syntax enable

filetype on
filetype plugin on
filetype indent on

"change buffer - without saving
set hidden

"do not redraw, when running macros... lazyredraw
set lazyredraw

set showmode

" Enable enhanced command-line completion.
set wildmenu

nmap <silent> ,ev :e $MYVIMRC<cr>
nmap          ,sv :so $MYVIMRC<cr>

"----------------------------------------------------------
set wrapscan
set shellslash

set cmdheight=2

" use visual bell instead of beeping
set visualbell

set backspace=2

set statusline=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]

" tell Vim to always put a status line in, even if there is only one window
set laststatus=2

set history=400

"set virtualedit=all
set virtualedit=block,insert

set complete=.,w,b,t
set showfulltag

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

set synmaxcol=2048

"set cpoptions+=$
set nobackup
set noswapfile
"----------------------------------------------------------
set textwidth=79
set formatoptions=tcq

set ignorecase
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

set guioptions-=T
" Autoselect
set guioptions+=a

" Disable encryption (:X)
set key=

" Add ignorance of whitespace to diff
set diffopt+=iwhite

set hlsearch
set incsearch

set clipboard+=unnamed

" auto read a file that has changed on disk
set autoread

set dictionary=~/words.txt

let mapleader = ","

" Wipe out all buffers
nmap <silent> ,wa :1,9000bwipeout<cr>

"----------------------------------------------------------
" Toggle paste mode
nmap ,p  :set invpaste<cr>:set paste?<cr>

" Toggle highlight search
nmap ,n  :set invhls<cr>:set hls?<cr>

" Toogle ignorecase search
nmap ,ic :set invic<cr>:set ic?<cr>

" Toggle text wrapping 
nmap ,ww :set invwrap<cr>:set wrap?<cr>

" Set up retabbing on a source file
nmap ,rr :1,$retab

" cd to the directory containing the file in the buffer
nmap ,cd :lcd %:h<cr>:pwd<cr>

" Make the directory that constains the file in the current buffer.
" This is useful when you edit a file in a directory that doesn't
" (yet) exist
nmap ,md :!mkdir -p %:p:h

noremap <silent> ,j :wincmd j<cr>
noremap <silent> ,k :wincmd k<cr>
noremap <silent> ,h :wincmd h<cr>
noremap <silent> ,l :wincmd l<cr>

noremap <silent> ,cj :wincmd j<cr>:close<cr>
noremap <silent> ,ck :wincmd k<cr>:close<cr>
noremap <silent> ,ch :wincmd h<cr>:close<cr>
noremap <silent> ,cl :wincmd l<cr>:close<cr>
noremap <silent> ,cc :close<cr>

" Move the current window to the h/j/k/l of the main Vim window
noremap <silent> ,ml <C-W>L
noremap <silent> ,mk <C-W>K
noremap <silent> ,mj <C-W>J
noremap <silent> ,mh <C-W>H

" Show all available VIM servers
nmap <silent> ,ss :echo serverlist()<cr>

" The following beast is something i didn't write... it will return the
" syntax highlighting group that the current "thing" under the cursor
" belongs to -- very useful for figuring out what to change as far as
" syntax highlighting goes.
nmap <silent> ,qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" allow command line editing like emacs
cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-N> <Down>
cnoremap <C-P> <Up>
   
" Search the current file for what's currently in the search register and display matches
nmap <silent> ,gs :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Search the current file for the word under the cursor and display matches
nmap <silent> ,gw :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Search the current file for the WORD under the cursor and display matches
nmap <silent> ,gW :vimgrep /<C-r><C-a>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Swap two words
" nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Toggle fullscreen mode
nmap <silent> <F3> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

" Underline the current line with '='
nmap <silent> ,ul :t.\|s/./=/g\|:nohls<cr>

" Shrink the current window to fit the number of lines in the buffer. Useful
" for those buffers that are only a few lines
nmap <silent> ,sw :execute ":resize " . line('$')<cr>

" Use the bufkill plugin to eliminate a buffer but keep the window layout
nmap ,bd :BD<cr>

" Use CTRL-E to replace the original ',' mapping
" nnoremap <C-E> ,

" I don't like it when the matching parens are automatically highlighted
" let loaded_matchparen = 1

" Highlight the current line and column
" Don't do this - It makes window redraws painfully slow
set nocursorline
set nocursorcolumn

set guifont=Lucida_Sans_Typewriter:h10:cANSI
colorscheme navajo-night


" quick save
nmap <F2> :w<CR>
nmap ,sa  :w<cr>
nmap <C-S> :w<cr>

" for bullet text editing
autocmd BufRead,BufNewFile *.txt,README,TODO,CHANGELOG,NOTES
        \ setlocal autoindent expandtab tabstop=4 softtabstop=2 shiftwidth=2 filetype=asciidoc
        \ textwidth=70 formatoptions=tcqn
        \ formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\\|^\\s*<\\d\\+>\\s\\+\\\\|^\\s*[a-zA-Z.]\\.\\s\\+\\\\|^\\s*[ivxIVX]\\+\\.\\s\\+
        \ comments=s1:/*,ex:*/,://,b:#,:%,:XCOMM,fb:-,fb:*,fb:+,fb:.,fb:>

" scroll in insert mode
inoremap <C-E> <C-X><C-E>
inoremap <C-Y> <C-X><C-Y>
inoremap <c-f> <c-x><c-f>

"set scrolloff=999
