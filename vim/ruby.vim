autocmd FileType ruby setlocal ts=2 sts=2 sw=2

hi rubySymbol ctermfg=111

autocmd FileType ruby noremap <buffer> <LocalLeader>ts :w!<CR>:!rspec<CR>
