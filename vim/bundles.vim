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

" Plugin 'Shougo/deoplete.nvim'
Plugin 'benekastah/neomake'

" Look and feel
Plugin 'bling/vim-airline'
"Plugin 'Lucius', '7.1.1'
Plugin 'jonathanfilip/vim-lucius'

"Plugin 'joshdick/onedark.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'kien/rainbow_parentheses.vim'

" Integratation
Plugin 'kassio/neoterm'
Plugin 'edkolev/tmuxline.vim'
Plugin 'edkolev/promptline.vim'
Plugin 'christoomey/vim-tmux-navigator'

" Filesystem
"Plugin 'kien/ctrlp.vim'
"Plugin 'wincent/Command-T'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf'
Plugin 'rking/ag.vim'

" Editing
Plugin 'Lokaltog/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sleuth'
Plugin 'bootleq/vim-cycle'
Plugin 'terryma/vim-expand-region'

" Snipmate dependencies
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'

" Snippets
Plugin 'SirVer/ultisnips'

" Spelling & Grammar
"Plugin 'vim-scripts/LanguageTool'

" Web Development
" Plugin 'groenewege/vim-less'
Plugin 'mattn/emmet-vim'

" PHP
Plugin 'StanAngeloff/php.vim'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'tomphp/vim-phpdoc'
Plugin 'arnaud-lb/vim-php-namespace'
"Plugin 'scrooloose/syntastic.git'
"Plugin 'joonty/vdebug'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'vim-php/vim-php-refactoring'

" Coffeescript
Plugin 'kchmck/vim-coffee-script'

" Elm
" Plugin 'lambdatoast/elm.vim'
Plugin 'elmcast/elm-vim'

" Clojure
Plugin 'vim-scripts/paredit.vim'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'
Plugin 'tpope/vim-fireplace'

" Ruby
Plugin 'tpope/vim-endwise'

" Twig syntax
Plugin 'evidens/vim-twig'

" Nginx
Plugin 'evanmiller/nginx-vim-syntax'

" Used for vim debug
"Plugin 'tyru/open-browser.vim'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'airblade/vim-gitgutter'

" Haskell
Plugin 'dag/vim2hs'

" Idris
Plugin 'idris-hackers/idris-vim'

" Scala
Plugin 'derekwyatt/vim-scala'

" CSV
" Plugin 'chrisbra/csv.vim'

" VIM tools
Plugin 'guns/xterm-color-table.vim'
Plugin 'ktonga/vim-follow-my-lead'
