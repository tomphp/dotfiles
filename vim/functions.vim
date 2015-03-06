" Utilities
function! Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

" vDebug settings
" Allows the command :Debug http://127.0.0.1/Project/index.php to work
function! Debug(url)
    let url = a:url
    let leading_slash = stridx(url, '/')
    if leading_slash == 0
        let url = '127.0.0.1'.url
    endif
    " add 'http://' if it is not in url
    let http_pos = stridx(url, 'http')
    if http_pos != 0
        let url = 'http://'.url
    endif
    " add 'vim_debug' IDE key to url, this IDE key is also set in vdebug options
    let q_pos = stridx(url, '?')
    if q_pos == -1
        let url = url.'?XDEBUG_SESSION_START=vim_debug'
    else
        let url = url.'&XDEBUG_SESSION_START=vim_debug'
    endif
    " launch browser
    call OpenBrowser(url)
     " start debugging
    python debugger.run()
endfunction
command! -nargs=1 Debug call Debug('<args>')

function! DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction
