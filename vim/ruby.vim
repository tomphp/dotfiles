autocmd FileType ruby setlocal ts=2 sts=2 sw=2
autocmd FileType eruby setlocal ts=2 sts=2 sw=2

hi rubySymbol ctermfg=111

autocmd FileType ruby let b:acceptance_test_command = 'bundle exec cucumber'
autocmd FileType ruby let b:integration_test_command = 'bundle exec rspec spec/integration'
autocmd FileType ruby let b:unit_test_command = 'bundle exec rspec spec/unit'
autocmd FileType ruby let b:ci_test_command = 'bundle exec rake'

" Tags
if (executable('ctags')) 
    autocmd FileType ruby nnoremap <buffer> <f8> :exe ':!~/.dotfiles/bin/ruby-ctags "' . g:project_tags .'"'<CR>
    autocmd BufWritePost *.rb if filereadable(g:project_tags) | exec ':silent !~/.dotfiles/bin/ruby-ctags ' . g:project_tags . ' %' | endif
endif
