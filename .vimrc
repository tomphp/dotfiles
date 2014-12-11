" This is my personal vim config.
"
" Tom Oram - http://github.com/tomphp - <tom@x2k.co.uk>
"
" Inspired by:
" - EvanDotPro https://github.com/EvanDotPro/vim-configuration
" - ???
" - and others...


" Setup & Plugins {
    set nocompatible               " Use the new stuff
    filetype off                   " Turned back on after loading bundles

    "if filereadable(expand("$VIMHOME/config.local.vim"))
    "    source $VIMHOME/config.local.vim
    "endif

    " Forgotten why this is here?
    set rtp+=~/.vim/bundle/Vundle.vim/
    call vundle#rc()

    " let Vundle manage Vundle
    " required! 
    Plugin 'gmarik/Vundle.vim'

    " Navigating
    Plugin 'kien/ctrlp.vim'
    Plugin 'scrooloose/nerdtree'
    "Plugin 'Lokaltog/powerline', 'develop'
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'christoomey/vim-tmux-navigator'
    Plugin 'Shougo/neocomplcache.vim'
    Plugin 'JazzCore/neocomplcache-ultisnips'

    " Editing
    Plugin 'tpope/vim-surround'
    Plugin 'godlygeek/tabular'

    " Theme
    Plugin 'Lucius', '7.1.1'
    "Plugin 'altercation/vim-colors-solarized'
    "Plugin 'spf13/vim-colors'
    Plugin 'groenewege/vim-less'
    Plugin 'kien/rainbow_parentheses.vim'

    " Spelling & Grammar
    Plugin 'vim-scripts/LanguageTool'

    " PHP
    "Plugin 'Valloric/YouCompleteMe'
    Plugin 'StanAngeloff/php.vim'
    Plugin 'shawncplus/phpcomplete.vim'
    Plugin 'tomphp/vim-phpdoc'
    Plugin 'arnaud-lb/vim-php-namespace'
    Plugin 'scrooloose/syntastic.git'
    Plugin 'joonty/vdebug'
    Plugin 'stephpy/vim-php-cs-fixer'
    Plugin 'vim-php/vim-php-refactoring'

    " Coffeescript
    Plugin 'kchmck/vim-coffee-script'

    " Clojure
    Plugin 'guns/vim-clojure-static'
    Plugin 'guns/vim-clojure-highlight'
    Plugin 'tpope/vim-fireplace'

    " Twig syntax
    Plugin 'lunaru/vim-twig'

    " Used for vim debug
    Plugin 'tyru/open-browser.vim'

    " Git
    Plugin 'tpope/vim-fugitive'
    Plugin 'mattn/webapi-vim'
    Plugin 'mattn/gist-vim'
    Plugin 'airblade/vim-gitgutter'

    " Puppet syntax
    Plugin 'rodjek/vim-puppet'

    " Snipmate dependencies
    Plugin 'MarcWeber/vim-addon-mw-utils'
    Plugin 'tomtom/tlib_vim'
    Plugin 'tomphp/vim-snippets'

    " SnipMate
    "Plugin 'garbas/vim-snipmate'
    Plugin 'SirVer/ultisnips'

    " Scala
    Plugin 'derekwyatt/vim-scala'
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
        
        " Rainbow parentheses
        let g:rbpt_colorpairs = [
            \ ['229', '229'],
            \ ['226', '226'],
            \ ['216', '216'],
            \ ['166', '166'],
            \ ['165', '165'],
            \ ['27', '27'],
            \ ['33', '33'],
            \ ['49', '49'],
            \ ['148', '148'],
            \ ['190', '190'],
            \ ['214', '214'],
            \ ['219', '219'],
        \ ]

        au VimEnter * RainbowParenthesesToggle
        au Syntax * RainbowParenthesesLoadRound
        au Syntax * RainbowParenthesesLoadSquare
        au Syntax * RainbowParenthesesLoadBraces
    " }
    
    " Key Mappings {
        "Navigate wrapped lines
        nnoremap j gj
        nnoremap k gk

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

        " UltiSnips
        let g:UltiSnipsExpandTrigger="<tab>"
        let g:UltiSnipsJumpForwardTrigger="<tab>"
        let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

        " CTRL+S for save

        " If the current buffer has never been saved, it will have no name,
        " call the file browser to save it, otherwise just save it.
        command! -nargs=0 -bar Update if &modified 
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
        noremap <Leader>t :NERDTreeToggle<CR>

        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

        " Select all
        noremap <Leader>a ggVG

        " Move lines up and down (requires alt aka gvim)
        nnoremap <A-j> :m .+1<CR>==
        nnoremap <A-k> :m .-2<CR>==
        inoremap <A-j> <Esc>:m .+1<CR>==gi
        inoremap <A-k> <Esc>:m .-2<CR>==gi
        vnoremap <A-j> :m '>+1<CR>gv=gv
        vnoremap <A-k> :m '<-2<CR>gv=gv
    " }

    " CtrlP {
        let g:ctrlp_max_files=50000
    " }
    
    " neocomplcache {
        let g:acp_enableAtStartup = 0
        let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_min_syntax_length = 3
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
        "set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim/
        python from powerline.vim import setup as powerline_setup
        python powerline_setup()
        python del powerline_setup
    " }
    
    " LanguageTool {
        let g:languagetool_jar='$HOME/Applications/LanguageTool-2.6/languagetool-commandline.jar'
        let g:languagetool_disable_rules='WHITESPACE_RULE,EN_QUOTES,MORFOLOGIK_RULE_EN_GB,COMMA_PARENTHESIS_WHITESPACE'
    " }
" }

" C++ {
" Settings {
    autocmd FileType cpp setlocal ts=2 sts=2 sw=2
    
    " C++11
    let g:syntastic_cpp_compiler_options = ' -std=c++11'
" }
" }

" Cucumber {
" Settings {
    autocmd FileType cucumber setlocal ts=2 sts=2 sw=2
" }
" }

" PHP {
" Settings {
    autocmd FileType php setlocal ts=4 sts=4 sw=4

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

    " Refactoring
    let g:php_refactor_command='php ~/bin/refactor.phar'

    " CS Fixer
    let g:php_cs_fixer_path = "php-cs-fixer" 
    let g:php_cs_fixer_level = "all"       
    let g:php_cs_fixer_config = "default" 
    let g:php_cs_fixer_php_path = "php"     
    " let g:php_cs_fixer_fixers_list = "linefeed,short_tag,indentation"
    let g:php_cs_fixer_enable_default_mapping = 1
    let g:php_cs_fixer_dry_run = 0
    let g:php_cs_fixer_verbose = 1
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
    autocmd FileType php inoremap <buffer> <LocalLeader>d <ESC>:call PhpDocSingle()<CR>i 
    autocmd FileType php nnoremap <buffer> <LocalLeader>d :call PhpDocSingle()<CR> 
    autocmd FileType php vnoremap <buffer> <LocalLeader>d :call PhpDocRange()<CR>

    " PHP Namespace remaps
    autocmd FileType php noremap <buffer> <LocalLeader>n :call PhpInsertUse()<CR>
    autocmd FileType php noremap <buffer> <LocalLeader>e :call PhpExpandClass()<CR>

    " PHP Parsing & Checking commands
    autocmd FileType php noremap <buffer> <C-M> :w!<CR>:!php %<CR>
    autocmd FileType php noremap <buffer> <LocalLeader>l :w!<CR>:!php -l %<CR>
    autocmd FileType php noremap <buffer> <LocalLeader>b :w!<CR>:!vendor/bin/behat<CR>
    autocmd FileType php noremap <buffer> <LocalLeader>u :w!<CR>:!vendor/bin/phpunit<CR>
    autocmd FileType php noremap <buffer> <LocalLeader>s :w!<CR>:!vendor/bin/phpspec run -v<CR>

    " Cucumber
    autocmd FileType cucumber noremap <buffer> <LocalLeader>b :w!<CR>:!vendor/bin/behat %<CR>

    "autocmd FileType php nnoremap <buffer> nnoremap <f8> :exe ':!ctags-exuberant -f ' . g:project_tags . ' -h \".php\" -R --exclude=\"\.git\" --totals=yes --tag-relative=yes --fields=+afkst --PHP-kinds=+cf'<CR>
    "autocmd FileType php nnoremap <buffer> nnoremap <f8> :exe ':!phpctags -h ".php" -R --exclude=".git" --exclude="vendor/pdepend" --exclude="composer.phar" --sort=yes --tag-relative=yes --fields=+aimS --languages=php'<CR>
    autocmd FileType php nnoremap <buffer> <f8> :exe ':!phpctags --flags="+aim" --exclude=".git" --exclude="vendor/pdepend" --exclude="composer.phar" --sort=yes --memory=-1 --recurse=yes -f "' . g:project_tags .'" .'<CR>
    autocmd FileType php nnoremap <buffer> execute "set tags=" . g:project_tags
" }
" }
"
" Scala {
    " 2 space indents
    autocmd FileType scala setlocal ts=2 sts=2 sw=2
" }

" Javascript {
    " 2 space indents
    autocmd FileType javascript setlocal ts=2 sts=2 sw=2
" }

" Coffeescript {
    " 2 space indents
    autocmd FileType coffee setlocal ts=2 sts=2 sw=2
" }

" HTML {
    " 2 space indents
    autocmd FileType html setlocal ts=2 sts=2 sw=2
" }

" Text {
    autocmd FileType text setlocal spell spelllang=en_gb
    autocmd FileType markdown setlocal spell spelllang=en_gb
" }

" Utilities
func! Eatchar(pat)
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
