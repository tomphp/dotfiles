autocmd FileType javascript setlocal ts=2 sts=2 sw=2

let g:syntastic_javascript_checkers = ['eslint']

autocmd FileType php noremap <buffer> <LocalLeader>ts :w!<CR>:!npm test<CR>
