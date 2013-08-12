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

" Navigating
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/powerline', 'develop'
Bundle 'Lokaltog/vim-easymotion'

" Editing
Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'

" Theme
Bundle 'Lucius', '7.1.1'
"Bundle 'altercation/vim-colors-solarized'
"Bundle 'spf13/vim-colors'

" PHP
"Bundle 'Valloric/YouCompleteMe'
Bundle 'StanAngeloff/php.vim'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'tomphp/vim-phpdoc'
Bundle 'arnaud-lb/vim-php-namespace'
Bundle 'scrooloose/syntastic.git'
Bundle 'joonty/vdebug'

" Used for vim debug
Bundle 'tyru/open-browser.vim'

" Git
Bundle 'tpope/vim-fugitive'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'airblade/vim-gitgutter'

" Snipmate dependencies
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'tomphp/vim-snippets'

" SnipMate
Bundle 'garbas/vim-snipmate'

" Keeps an automatic backup
"set backup          " Enable Backups
"set backupext=.bak  " Add .bak extension to modified files
"set patchmode=.orig " Copy original file to with .orig extension Before saving.

" Theme
set shortmess+=I                       " Disable splash text
set t_Co=256                           " Fix colors in the terminal
"set guifont=Anonymous\ Pro\ 10         " Way better than monospace
let g:lucius_style = 'dark'
silent color lucius                    " Vim colorscheme
let g:Powerline_colorscheme = 'lucious' " Powerline colorscheme
set laststatus=2                       " Always show status bar
set noshowmode                         " Hide default mode string
set mousemodel=popup                   " Enable context menu

" Hurry up powerline when exiting insert mode
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" Clean up the GUI in Gvim
if has("gui_running")
    set guioptions-=T
    set guioptions-=m
    set guioptions+=LlRrb " bug?
    set guioptions-=LlRrb
    set guifont=monospace\ 9         " Way better than monospace
endif

" File Type detection
filetype on
filetype plugin on

" Auto completion
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Strip trailing white space from .php files
autocmd BufWritePre *.php :%s/\s\+$//e

" Allow backspacing before the insert point
set backspace=indent,eol,start

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

" Syntax highlighting
syntax on

" Enable Code Folding
set foldenable
set foldmethod=syntax
"let php_folding=1

" Highlight the cursorline
set cursorline

" Show lines that exceed 80 characters
"match ErrorMsg '\%80v.\+'
highlight ColorColumn ctermbg=238 guibg=#444444
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

" PHP Namespace remaps

autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>

" PHP Parsing & Checking commands
autocmd FileType php noremap <C-M> :w!<CR>:!php %<CR>
autocmd FileType php noremap <Leader>l :w!<CR>:!php -l %<CR>
autocmd FileType php noremap <Leader>u :w!<CR>:!vendor/bin/phpunit %<CR>
autocmd FileType php noremap <Leader>s :w!<CR>:!vendor/bin/phpcs --standard=psr2 %<CR>

let g:project_tags='~/.vim.tags/' . substitute(g:start_dir, "/", ".", "g")
"nnoremap <f8> :exe ':!ctags-exuberant -f ' . g:project_tags . ' -h \".php\" -R --exclude=\"\.git\" --totals=yes --tag-relative=yes --fields=+afkst --PHP-kinds=+cf'<CR>
nnoremap <f8> :exe ':!phpctags -h ".php" -R --exclude=".git" --exclude="vendor/pdepend" --sort=yes --tag-relative=yes --fields=+aimS --languages=php'<CR>
"execute "set tags=" . g:project_tags

" vDebug settings
" Allows the command :Debug http://127.0.0.1/Project/index.php to work
function! Debug(url)
    let url = a:url
    let leading_slash = stridx(url, '/')
    if leading_slash == 0
        let url = '127.0.0.1'.url
    endif
    " add 'http://' if it is not in url
    let http_pos = stridx(url, 'http')
    if http_pos != 0
        let url = 'http://'.url
    endif
    " add 'vim_debug' IDE key to url, this IDE key is also set in vdebug options
    let q_pos = stridx(url, '?')
    if q_pos == -1
        let url = url.'?XDEBUG_SESSION_START=vim_debug'
    else
        let url = url.'&XDEBUG_SESSION_START=vim_debug'
    endif
    " launch browser
    call OpenBrowser(url)
     " start debugging
    python debugger.run()
endfunction
command! -nargs=1 Debug call Debug('<args>')

