"
" vim: syntax=vim

set nocompatible               " Use the new stuff
filetype off                   " Turned back on after loading bundles

" Forgotten why this is here?
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

Plugin 'Shougo/vimproc'

" Navigating
"Plugin 'kien/ctrlp.vim'
Plugin 'wincent/Command-T'
"Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler.vim'
"Plugin 'Lokaltog/powerline', 'develop'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'rking/ag.vim'

" Editing
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'

" Theme
Plugin 'Lucius', '7.1.1'
Plugin 'groenewege/vim-less'
Plugin 'kien/rainbow_parentheses.vim'

" Spelling & Grammar
Plugin 'vim-scripts/LanguageTool'

" HTML
Plugin 'mattn/emmet-vim'

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
Plugin 'vim-scripts/paredit.vim'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'
Plugin 'tpope/vim-fireplace'

Plugin 'tpope/vim-endwise'

" Twig syntax
Plugin 'evidens/vim-twig'

" Used for vim debug
Plugin 'tyru/open-browser.vim'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'airblade/vim-gitgutter'

" Puppet syntax
"Plugin 'rodjek/vim-puppet'

" Snipmate dependencies
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
"Plugin 'tomphp/vim-snippets'

" SnipMate
"Plugin 'garbas/vim-snipmate'
"Plugin 'SirVer/ultisnips'

" Scala
Plugin 'derekwyatt/vim-scala'

" Gmail
"Plugin 'yuratomo/gmail.vim'

" Colour table
Plugin 'guns/xterm-color-table.vim'
