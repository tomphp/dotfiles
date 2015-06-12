" Luscious color scheme {
    let g:lucius_style = 'dark'
    silent color lucius                    " Vim colorscheme
    let g:Powerline_colorscheme = 'lucious' " Powerline colorscheme
" }

" Ag {
    let g:agprg="ag --ignore tags --column"
" }

" neocomplete {
    let g:neocomplete#enable_at_startup = 1
" }

" neosnippet {
    " Plugin key-mappings.
    imap <C-j> <Plug>(neosnippet_expand_or_jump)
    smap <C-j> <Plug>(neosnippet_expand_or_jump)
    xmap <C-j> <Plug>(neosnippet_expand_target)
    
    " For snippet_complete marker.
    if has('conceal')
      set conceallevel=2 concealcursor=niv
    endif
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

" }

" vimfiler {
    let g:vimfiler_as_default_explorer = 1
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

" vim-scala {
    " Turn off default key mappings as it interfears with my key mappings
    let g:scala_use_default_keymappings = 0
" }
