" Luscious color scheme {
    let g:lucius_style = 'dark'
    silent color lucius                    " Vim colorscheme
    " let g:Powerline_colorscheme = 'lucious' " Powerline colorscheme
" }

" Ag {
    let g:agprg="ag --ignore tags --column"
" }

" neocomplete {
"   let g:neocomplete#enable_at_startup = 1
"   let g:neocomplete#enable_smart_case = 1
"   let g:neocomplete#auto_completion_start_length = 3
" }

" neosnippet {
"   " Plugin key-mappings.
"   imap <C-j> <Plug>(neosnippet_expand_or_jump)
"   smap <C-j> <Plug>(neosnippet_expand_or_jump)
"   xmap <C-j> <Plug>(neosnippet_expand_target)
"   
"   " For snippet_complete marker.
"   if has('conceal')
"     set conceallevel=2 concealcursor=niv
"   endif
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

" CommandT {
    let g:CommandTSmartCase = 1
" }

" NerdTree {
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" }

" Airline {
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1
    let g:airline_theme = 'dark'
" }

" Promptline {
    let g:promptline_theme = 'airline_insert'

    let g:promptline_preset = {
        \'a' : [ promptline#slices#battery({ 'threshold': 25 }), promptline#slices#last_exit_code() ],
        \'b' : [ promptline#slices#vcs_branch() ],
        \'c' : [ promptline#slices#cwd() ] }
" }

" Git Gutter {
    let g:gitgutter_realtime = 0
    let g:gitgutter_eager = 0
" }

" vim-scala {
    " Turn off default key mappings as it interfears with my key mappings
    let g:scala_use_default_keymappings = 0
" }

" Syntastic {
    let g:syntastic_debug = 0
" }
