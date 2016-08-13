" This is my personal vim config.
"
" Tom Oram - http://github.com/tomphp - <tom@x2k.co.uk>
"
" Inspired by:
" - EvanDotPro https://github.com/EvanDotPro/vim-configuration
" - Gianluca Arbezzano https://github.com/gianarb/.dotfiles
" - and others...

if isdirectory($HOME."/.vim")
    let g:plugins_installed = 1

    source $HOME/.dotfiles/vim/bundles.vim
    source $HOME/.dotfiles/vim/bundle_globals.vim
endif

source $HOME/.dotfiles/vim/globals.vim
source $HOME/.dotfiles/vim/functions.vim

source $HOME/.dotfiles/vim/environment.vim
source $HOME/.dotfiles/vim/keymappings.vim
    
source $HOME/.dotfiles/vim/code.vim
source $HOME/.dotfiles/vim/clojure.vim
source $HOME/.dotfiles/vim/php.vim
source $HOME/.dotfiles/vim/ruby.vim
source $HOME/.dotfiles/vim/text.vim
source $HOME/.dotfiles/vim/haskell.vim

source $HOME/.dotfiles/vim/testing.vim

" Use local vimrc if available
if filereadable(expand("./.vimpj.vim"))
    source ./.vimpj.vim
endif

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Workspace Setup
" ----------------
function! DefaultWorkspace()
    " Rough num columns to decide between laptop and big monitor screens
    let numcol = 2
    if winwidth(0) >= 220
        let numcol = 3
    endif

    sp term://zsh
    wincmd J
    resize 10
    wincmd k

    if numcol == 3
        vnew
    endif

    vnew
endfunction
command! -register DefaultWorkspace call DefaultWorkspace()


"{{{ Cursor Color Customizations → 
"These are based on blaenkdenum's cool
"mode aware cursor hack. For more, visit
"http://www.blaenkdenum.com/posts/a-simpler-vim-statusline/
"Set the cursor color according to the mode.
"This one should work for most Dark Themes 
hi ModeMsg guifg=#FD971F guibg=NONE gui=NONE
"set gcr=a:block
" mode aware cursors
set gcr+=o:hor50-Cursor
set gcr+=n:Cursor
set gcr+=i-ci-sm:InsertCursor
set gcr+=r-cr:ReplaceCursor-hor20
set gcr+=c:CommandCursor
set gcr+=v-ve:VisualCursor
hi InsertCursor ctermfg=15 guifg=#fdf6e3 ctermbg=37 guibg=#FD971F
hi VisualCursor ctermfg=15 guifg=#000000 ctermbg=125 guibg=#AE81FF
hi ReplaceCursor ctermfg=15 guifg=#fdf6e3 ctermbg=65 guibg=#66D9EF
hi CommandCursor ctermfg=15 guifg=#fdf6e3 ctermbg=166 guibg=#A6E22E
"--------------------------------------------------------------
"}}}
