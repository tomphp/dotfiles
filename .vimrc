" Keeps an automatic backup
"set backup          " Enable Backups
"set backupext=.bak  " Add .bak extension to modified files
"set patchmode=.orig " Copy original file to with .orig extension Before saving.

" File Type detection
filetype on
filetype plugin on
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Indentation settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Set Auto-indent options
set cindent
set smartindent
set autoindent

" Spell checking
"set spell

" Enable Code Folding
"set foldenable
"set foldmethod=syntax

" Show lines that exceed 80 characters
match ErrorMsg '\%80v.\+'

" Line Numbers
set number

" Show a status bar
set ruler
set laststatus=2

" Show Tab Bar
" gt gT
set showtabline=2

" Set Search options highlight, and wrap search
set hls is      " highlight search text throughout the document.
set wrapscan    " wrap the scan around the document
"set ic          "ignore case in search

""""" PLUGINS

" Project Workspace
source ~/.vim/plugin/project.vim

" PHP Documentor
source ~/.vim/plugin/php-doc.vim 

""""" KEYBOARD MAPPINGS

" CTRL+S for save

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified 
    \|  if empty(bufname('%'))
    \|      browse confirm write
    \|  else
    \|      confirm write
    \|  endif
    \|endif

nnoremap <silent> <C-S> :<C-u>Update<CR>
inoremap <c-s> <c-o>:Update<CR>

" CTRL+SPACE for autocomplete
imap <c-Space> <c-x><c-o>
imap <C-@> <C-Space>

" CTRL+P for phpDoc
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR>
