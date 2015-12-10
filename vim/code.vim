function ToGlobExtension(extension)
    return '*.' . a:extension
endfunction

function SetIndentation(fileType, indentation)
    execute 'autocmd FileType ' . a:fileType . ' setlocal'
        \ . ' tabstop=' . a:indentation
        \ . ' softtabstop=' . a:indentation
        \ . ' shiftwidth=' . a:indentation
endfunction

function SetStripTrailingWhitespace(extensions)
    call map(a:extensions, 'ToGlobExtension(v:val)')

    execute 'autocmd BufWritePre ' . join(a:extensions, ',') . ' :%s/\s\+$//e'
endfunction

function SetCodeFileType(fileType, indentation, extensions)
    call SetIndentation(a:fileType, a:indentation)
    call SetStripTrailingWhitespace(a:extensions)
endfunction

call SetCodeFileType('coffee', 2, ['coffee'])
call SetCodeFileType('cpp', 2, ['c', 'cpp', 'h', 'hpp'])
call SetCodeFileType('cucumber', 2, ['feature'])
call SetCodeFileType('eruby', 2, ['erb'])
call SetCodeFileType('haskell', 2, ['hs'])
call SetCodeFileType('html', 2, ['htm', 'html'])
call SetCodeFileType('html.twig', 2, ['twig'])
call SetCodeFileType('javascript', 2, ['js', 'jsx'])
call SetCodeFileType('json', 2, ['json'])
call SetCodeFileType('php', 4, ['php'])
call SetCodeFileType('ruby', 2, ['rb'])
call SetCodeFileType('sass', 2, ['sass'])
call SetCodeFileType('scala', 2, ['scala'])
call SetCodeFileType('scss', 2, ['scss'])
call SetCodeFileType('sh', 2, ['sh'])
call SetCodeFileType('vim', 2, ['vim'])
call SetCodeFileType('xml', 2, ['xml'])
call SetCodeFileType('yaml', 2, ['yaml', 'yml'])
