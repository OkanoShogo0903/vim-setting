"==============================================
"コマンドで、対応する'h'もしくは'cpp'を開く
    command! OpenFile call OpenFileFunc()
    command! Of call OpenFileFunc()
    function! OpenFileFunc()

"cppならhを、hならcppを開くようにする
        let l:file_name = expand("%:r")

        if expand("%:e")=="h"
            let l:extension = expand("cpp")
        elseif expand("%:e")=="cpp"
            let l:extension = expand("h")
        else
            echo "Not available"
            return '0'
        endif

"splitで開く        
        if filereadable(l:file_name . '.' . l:extension)
            let l:ex_code = l:file_name . '.' . l:extension
            execute 'split ' . l:ex_code
            return '1'
        else
            echo "Read Error"
        endif

    endfunction
"==============================================
"自動で、対応する'h'もしくは'cpp'を開く
"    autocmd BufNewFile *.cpp 0r $HOME/.vim/comment.txt
    
"グループ作る遊び
    let g:open_file_auto_enable = 1
    augroup OpenFiles
        autocmd!
        if g:open_file_auto_enable
            autocmd BufNewFile,BufRead *.cpp,*.h call OpenFileAutoFunc()
        endif
""        autocmd func_name * w
    augroup END

    function! OpenFileAutoFunc()
        if OpenFileFunc()
"            normal <C-w>w
        endif
    endfunction
"==============================================

