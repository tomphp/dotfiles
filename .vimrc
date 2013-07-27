set nocompatible               " be iMproved
filetype off                   " required!

if filereadable(expand("$VIMHOME/config.local.vim"))
    source $VIMHOME/config.local.vim
endif

" Save the directory we started in
let g:start_dir=getcwd()

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-easymotion'
"Bundle 'AutoComplPop'
Bundle 'StanAngeloff/php.vim'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'tomphp/vim-phpdoc'
Bundle 'Lokaltog/powerline'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'mattn/gist-vim'
Bundle 'godlygeek/tabular'
Bundle 'airblade/vim-gitgutter'
Bundle 'scrooloose/syntastic.git'

" Snipmate dependencies
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "tomphp/vim-snippets", "tomphp-snippets"

" SnipMate
Bundle "garbas/vim-snipmate"

" Keeps an automatic backup
"set backup          " Enable Backups
"set backupext=.bak  " Add .bak extension to modified files
"set patchmode=.orig " Copy original file to with .orig extension Before saving.

" File Type detection
filetype on
filetype plugin on

" Auto completion
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Strip trailing white space from .php files
autocmd BufWritePre *.php :%s/\s\+$//e

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
set foldenable
set foldmethod=syntax
let php_folding=1

" Show lines that exceed 80 characters
"match ErrorMsg '\%80v.\+'
highlight ColorColumn ctermbg=6
set colorcolumn=80

" Show whitespaces
set listchars=tab:▸\ 
set list

" Line Numbers
set number

" Show a status bar
set ruler
set laststatus=2

" Show Tab Bar
" gt gT
set showtabline=2

" Window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Set Search options highlight, and wrap search
set hls is      " highlight search text throughout the document.
set wrapscan    " wrap the scan around the document
"set ic          "ignore case in search

" Powerline settings
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim/

" PHPDoc settings
if !exists("g:pdv_cfg_Author")
    let g:pdv_cfg_Author = "Tom Oram <tom@scl.co.uk>"
endif

" Set up syntax checker
let g:syntastic_php_checkers=['php', 'vendor/bin/phpcs', 'vendor/bin/phpmd']

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
"imap <c-Space> <c-x><c-o>
"imap <C-@> <C-Space>

" phpDoc
inoremap <Leader>d <ESC>:call PhpDocSingle()<CR>i 
nnoremap <Leader>d  :call PhpDocSingle()<CR> 
vnoremap <Leader>d :call PhpDocRange()<CR>

" NERDTree Mappings
"autocmd vimenter * if !argc() | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" PHP shortcuts
"autocmd FileType php inoremap <C--> ->
"autocmd FileType php inoremap <C-=>> =>

" PHP Parsing & Checking commands
autocmd FileType php noremap <C-M> :w!<CR>:!php %<CR>
autocmd FileType php noremap <Leader>l :w!<CR>:!php -l %<CR>
autocmd FileType php noremap <Leader>u :w!<CR>:!vendor/bin/phpunit %<CR>
autocmd FileType php noremap <Leader>s :w!<CR>:!vendor/bin/phpcs --standard=psr2 %<CR>

let g:project_tags='~/.vim.tags/' . substitute(g:start_dir, "/", ".", "g")
"nnoremap <f5> :exe ':!ctags-exuberant -f ' . g:project_tags . ' -h \".php\" -R --exclude=\"\.git\" --totals=yes --tag-relative=yes --fields=+afkst --PHP-kinds=+cf'<CR>
nnoremap <f5> :exe ':!phpctags -h ".php" -R --exclude=".git" --exclude="vendor/pdepend" --sort=yes --tag-relative=yes --fields=+aimS --languages=php'<CR>
"execute "set tags=" . g:project_tags
