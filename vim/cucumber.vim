autocmd FileType cucumber setlocal ts=2 sts=2 sw=2

" Strip trailing white space from .php files
autocmd BufWritePre *.feature :%s/\s\+$//e
