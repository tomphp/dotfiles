" This is my personal vim config.
"
" Tom Oram - http://github.com/tomphp - <tom@x2k.co.uk>
"
" Inspired by:
" - EvanDotPro https://github.com/EvanDotPro/vim-configuration
" - ???
" - and others...


"if filereadable(expand("$VIMHOME/config.local.vim"))
"    source $VIMHOME/config.local.vim
"endif

if isdirectory($HOME."/.vim")
    source $HOME/dotfiles/vim/bundles.vim
endif

source $HOME/dotfiles/vim/globals.vim
source $HOME/dotfiles/vim/functions.vim

source $HOME/dotfiles/vim/environment.vim
source $HOME/dotfiles/vim/keymappings.vim
    
source $HOME/dotfiles/vim/coffeescript.vim
source $HOME/dotfiles/vim/cpp.vim
source $HOME/dotfiles/vim/cucumber.vim
source $HOME/dotfiles/vim/html.vim
source $HOME/dotfiles/vim/javascript.vim
source $HOME/dotfiles/vim/markdown.vim
source $HOME/dotfiles/vim/php.vim
source $HOME/dotfiles/vim/scala.vim
source $HOME/dotfiles/vim/text.vim
