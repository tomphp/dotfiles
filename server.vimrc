" Vim for servers

set nocompatible               " Use the new stuff
filetype off                   " Turned back on after loading bundles

" File Type detection
filetype on
filetype plugin on
filetype plugin indent on

" Allow backspacing before the insert point
set backspace=indent,eol,start

" Indentation settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Set Auto-indent options
"set cindent
"set smartindent
set autoindent

" Syntax highlighting
syntax on

" Enable Code Folding
set foldenable
set foldmethod=indent
set foldlevelstart=5

" Highlight the cursorline
"set cursorline

" Spell checking
"set spell

" Show lines that exceed 80 characters
"match ErrorMsg '\%80v.\+'
highlight ColorColumn ctermbg=238 guibg=#444444
set colorcolumn=80

" Show whitespaces
set listchars=tab:▸\ 
set list

" Line Numbers
"set number

" Show a status bar
set ruler
set laststatus=2

" Show Tab Bar
"set showtabline=2

" Set Search options highlight, and wrap search
set hls is      " highlight search text throughout the document.
set wrapscan    " wrap the scan around the document
"set ic          "ignore case in search

" Keeps an automatic backup
"set backup          " Enable Backups
"set backupext=.bak  " Add .bak extension to modified files
"set patchmode=.orig " Copy original file to with .orig extension Before saving.
" }

" Key Mappings {
"Navigate wrapped lines
nnoremap j gj
nnoremap k gk

" Buffer navigation
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>

" Save as root
cnoremap w!! %!sudo tee > /dev/null %

" Better command line editing
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-h> <t_kl>
cnoremap <C-l> <t_kr>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

nnoremap <silent> <C-S> :<C-u>Update<CR>
inoremap <c-s> <c-o>:Update<CR>

" CTRL+SPACE for autocomplete
"imap <c-Space> <c-x><c-o>
"imap <C-@> <C-Space>

" Select all
noremap <Leader>a ggVG

" Move lines up and down (requires alt aka gvim)
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
