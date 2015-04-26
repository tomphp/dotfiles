autocmd FileType javascript setlocal ts=2 sts=2 sw=2

autocmd FileType ruby noremap <buffer> <LocalLeader>ts :w!<CR>:!rspec<CR>
