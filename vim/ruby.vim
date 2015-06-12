autocmd FileType ruby setlocal ts=2 sts=2 sw=2

hi rubySymbol ctermfg=111

autocmd FileType ruby noremap <buffer> <LocalLeader>ts :w!<CR>:!rspec<CR>

" Tags
if (executable('ctags')) 
    autocmd FileType ruby nnoremap <buffer> <f8> :exe ':!~/.dotfiles/bin/ruby-ctags "' . g:project_tags .'"'<CR>
    autocmd BufWritePost *.rb if filereadable(g:project_tags) | exec ':silent !~/.dotfiles/bin/ruby-ctags ' . g:project_tags . ' %' | endif
endif
