" Auto completion
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Folding
"let php_folding=1

" PHPDoc settings
if !exists("g:pdv_cfg_Author")
    let g:pdv_cfg_Author = "Tom Oram <tom@scl.co.uk>"
endif

" Set up syntax checker
let g:syntastic_php_checkers=['php', 'vendor/bin/phpcs', 'vendor/bin/phpmd']

" Ctags generation
"let g:project_tags='~/.vim.tags/' . substitute(g:start_dir, "/", ".", "g")
let g:project_tags='tags'

" Refactoring
let g:php_refactor_command='php ~/.dotfiles/bin/refactor.phar'

" CS Fixer
let g:php_cs_fixer_path = "php-cs-fixer" 
let g:php_cs_fixer_level = "all"       
let g:php_cs_fixer_config = "default" 
let g:php_cs_fixer_php_path = "php"     
" let g:php_cs_fixer_fixers_list = "linefeed,short_tag,indentation"
let g:php_cs_fixer_enable_default_mapping = 1
let g:php_cs_fixer_dry_run = 0
let g:php_cs_fixer_verbose = 1

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

    autocmd FileType php let b:lint_test_command = 'php -l %'
    autocmd FileType php let b:acceptance_test_command = 'vendor/bin/behat'
    autocmd FileType php let b:integration_test_command = 'vendor/bin/phpunit'
    autocmd FileType php let b:unit_test_command = 'vendor/bin/phpspec run -v -fpretty'
    autocmd FileType php let b:ci_test_command = 'composer test'

    " Cucumber
    autocmd FileType cucumber noremap <buffer> <LocalLeader>tf :w!<CR>:!vendor/bin/behat %<CR>
    autocmd FileType cucumber noremap <buffer> <LocalLeader>ts :w!<CR>:!vendor/bin/behat % --name "<C-R>""<CR>
    autocmd FileType cucumber noremap <buffer> <LocalLeader>ta :w!<CR>:!vendor/bin/behat<CR>

    " Tags
    if (executable('ctags')) 
        autocmd FileType php nnoremap <buffer> <f8> :exe ':!~/.dotfiles/bin/php-ctags "' . g:project_tags .'"'<CR>
        autocmd BufWritePost *.php if filereadable(g:project_tags) | exec ':silent !~/.dotfiles/bin/php-ctags ' . g:project_tags . ' %' | endif
    endif
" }
