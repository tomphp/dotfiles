" This is my personal vim config.
"
" Tom Oram - http://github.com/tomphp - <tom@x2k.co.uk>
"
" Inspired by:
" - EvanDotPro https://github.com/EvanDotPro/vim-configuration
" - ???
" - and others...


" Setup & Bundles {
    set nocompatible               " Use the new stuff
    filetype off                   " Turned back on after loading bundles

    "if filereadable(expand("$VIMHOME/config.local.vim"))
    "    source $VIMHOME/config.local.vim
    "endif

    " Forgotten why this is here?
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
    Bundle 'terryma/vim-multiple-cursors'
    Bundle 'christoomey/vim-tmux-navigator'

    " Editing
    Bundle 'tpope/vim-surround'
    Bundle 'godlygeek/tabular'

    " Theme
    Bundle 'Lucius', '7.1.1'
    "Bundle 'altercation/vim-colors-solarized'
    "Bundle 'spf13/vim-colors'
    Bundle 'groenewege/vim-less'

    " PHP
    "Bundle 'Valloric/YouCompleteMe'
    Bundle 'StanAngeloff/php.vim'
    Bundle 'shawncplus/phpcomplete.vim'
    Bundle 'tomphp/vim-phpdoc'
    Bundle 'arnaud-lb/vim-php-namespace'
    Bundle 'scrooloose/syntastic.git'
    Bundle 'joonty/vdebug'

    " Twig syntax
    Bundle 'lunaru/vim-twig'

    " Used for vim debug
    Bundle 'tyru/open-browser.vim'

    " Git
    Bundle 'tpope/vim-fugitive'
    Bundle 'mattn/webapi-vim'
    Bundle 'mattn/gist-vim'
    Bundle 'airblade/vim-gitgutter'

    " Puppet syntax
    Bundle 'rodjek/vim-puppet'

    " Snipmate dependencies
    Bundle 'MarcWeber/vim-addon-mw-utils'
    Bundle 'tomtom/tlib_vim'
    Bundle 'tomphp/vim-snippets'

    " SnipMate
    Bundle 'garbas/vim-snipmate'
" }

" Save the directory we started in
let g:start_dir=getcwd()

" General Settings {
    " gvim {
        " Clean up the GUI in Gvim
        if has("gui_running")
            set guioptions-=T
            set guioptions-=m
            set guioptions+=LlRrb " bug?
            set guioptions-=LlRrb
            set guifont=monospace\ 9 " Way better than monospace
        endif
    " }

    " Theme {
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
    " }
    
    " Basic look and feel settings {
        " File Type detection
        filetype on
        filetype plugin on

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

        " Syntax highlighting
        syntax on

        " Enable Code Folding
        set foldenable
        set foldmethod=syntax

        " Highlight the cursorline
        set cursorline

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
        set number

        " Show a status bar
        set ruler
        set laststatus=2

        " Show Tab Bar
        set showtabline=2

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

        " Save as root
        cmap w!! %!sudo tee > /dev/null %

        " Better command line editing
        cnoremap <C-j> <t_kd>
        cnoremap <C-k> <t_ku>
        cnoremap <C-h> <t_kl>
        cnoremap <C-l> <t_kr>
        cnoremap <C-a> <Home>
        cnoremap <C-e> <End>

        " Window navigation
        map <C-h> <C-w>h
        map <C-j> <C-w>j
        map <C-k> <C-w>k
        map <C-l> <C-w>l

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

    " NERDTree Mappings
    "autocmd vimenter * if !argc() | NERDTree | endif

    map <Leader>t :NERDTreeToggle<CR>

    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

    nnoremap <A-j> :m .+1<CR>==
    nnoremap <A-k> :m .-2<CR>==
    inoremap <A-j> <Esc>:m .+1<CR>==gi
    inoremap <A-k> <Esc>:m .-2<CR>==gi
    vnoremap <A-j> :m '>+1<CR>gv=gv
    vnoremap <A-k> :m '<-2<CR>gv=gv
" }

" Powerline {
    " Hurry up powerline when exiting insert mode
    if ! has('gui_running')
        set ttimeoutlen=10
        augroup FastEscape
            autocmd!
            au InsertEnter * set timeoutlen=0
            au InsertLeave * set timeoutlen=1000
        augroup END
    endif

    " Powerline settings
    set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim/
" }
" }

" C++ {
" Settings {
    autocmd FileType cpp set tabstop=2
    autocmd FileType cpp set softtabstop=2
    autocmd FileType cpp set shiftwidth=2
    autocmd FileType cpp set expandtab
    
    " C++11
    let g:syntastic_cpp_compiler_options = ' -std=c++11'
" }
" }

" PHP {
" Settings {
    " Auto completion
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP

    " Strip trailing white space from .php files
    autocmd BufWritePre *.php :%s/\s\+$//e

    " Indentation rules
    autocmd FileType php set expandtab

    "let php_folding=1
    " PHPDoc settings
    if !exists("g:pdv_cfg_Author")
        let g:pdv_cfg_Author = "Tom Oram <tom@scl.co.uk>"
    endif

    " Set up syntax checker
    let g:syntastic_php_checkers=['php', 'vendor/bin/phpcs', 'vendor/bin/phpmd']

    " Ctags generation
    let g:project_tags='~/.vim.tags/' . substitute(g:start_dir, "/", ".", "g")
" }

" Cool features {
    "autocmd FileType php inoremap <buffer> <silent> > ><Esc>:call <SID>phpalign()<CR>A
    "function! s:phpalign()
    "    let p = '^\s*\w+\s*[=+]>.*$'
    "    let lineContainsHashrocket = getline('.') =~# '^\s*\w+\s*[=+]>'
    "    let hashrocketOnPrevLine = getline(line('.') - 1) =~# p
    "    let hashrocketOnNextLine = getline(line('.') + 1) =~# p
    "    if exists(':Tabularize') " && lineContainsHashrocket && (hashrocketOnPrevLine || hashrocketOnNextLine)
    "        Tabularize /=>/l1
    "        normal! 0
    "    endif
    "endfunction
" }

" Abbreviations {
    autocmd FileType php iabbr $t $this-><c-r>=Eatchar('')<cr>
    autocmd FileType php iabbr iae InvalidArguementException<c-r>=Eatchar('')<cr>
    autocmd FileType php iabbr rte RuntimeException<c-r>=Eatchar('')<cr>
" }

" Keyboard Mappings {
    " PHP shortcuts
    "autocmd FileType php inoremap <C--> ->
    "autocmd FileType php inoremap <C-=>> =>

    " phpDoc
    autocmd FileType php inoremap <Leader>d <ESC>:call PhpDocSingle()<CR>i 
        autocmd FileType php nnoremap <Leader>d  :call PhpDocSingle()<CR> 
        autocmd FileType php vnoremap <Leader>d :call PhpDocRange()<CR>

        " PHP Namespace remaps
        autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>
        autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>

        " PHP Parsing & Checking commands
        autocmd FileType php noremap <C-M> :w!<CR>:!php %<CR>
        autocmd FileType php noremap <Leader>l :w!<CR>:!php -l %<CR>
        autocmd FileType php noremap <Leader>u :w!<CR>:!vendor/bin/phpunit %<CR>
        autocmd FileType php noremap <Leader>s :w!<CR>:!vendor/bin/phpcs --standard=psr2 %<CR>

        "nnoremap <f8> :exe ':!ctags-exuberant -f ' . g:project_tags . ' -h \".php\" -R --exclude=\"\.git\" --totals=yes --tag-relative=yes --fields=+afkst --PHP-kinds=+cf'<CR>
        nnoremap <f8> :exe ':!phpctags -h ".php" -R --exclude=".git" --exclude="vendor/pdepend" --exclude="composer.phar" --sort=yes --tag-relative=yes --fields=+aimS --languages=php'<CR>
        "execute "set tags=" . g:project_tags
    " }
" }

" Utilities
func Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

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

