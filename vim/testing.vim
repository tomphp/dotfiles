function SaveAndRunCommand(command)
    execute ':w!'
    "execute ':!' . a:command
    execute ':T ' . a:command
endfunction

map <Leader>tl :call SaveAndRunCommand(b:lint_test_command)<CR>
map <Leader>ta :call SaveAndRunCommand(b:acceptance_test_command)<CR>
map <Leader>ti :call SaveAndRunCommand(b:integration_test_command)<CR>
map <Leader>tu :call SaveAndRunCommand(b:unit_test_command)<CR>
map <Leader>tci :call SaveAndRunCommand(b:ci_test_command)<CR>
