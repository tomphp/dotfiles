" Luscious color scheme {
    let g:lucius_style = 'dark'
    silent color lucius                    " Vim colorscheme
    let g:Powerline_colorscheme = 'lucious' " Powerline colorscheme
" }

" Ag {
    let g:agprg="ag --ignore tags --column"
" }

" CtrlP {
    let g:ctrlp_max_files=50000
" }

" neocomplcache {
    let g:acp_enableAtStartup = 0
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_min_syntax_length = 3
" }

" LanguageTool {
    let g:languagetool_jar='$HOME/Applications/LanguageTool-2.6/languagetool-commandline.jar'
    let g:languagetool_disable_rules='WHITESPACE_RULE,EN_QUOTES,MORFOLOGIK_RULE_EN_GB,COMMA_PARENTHESIS_WHITESPACE'
" }

" Rainbow parentheses {
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

" NerdTree {
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" }


" Powerline {
    " Need to find a better way to check if powerline is installed
    if isdirectory(expand($HOME."/.config"))
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
    endif
" }
