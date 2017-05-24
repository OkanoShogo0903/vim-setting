"---------------------------------------------------------
" Robocup plugin
" 
" ロボカップ標準となるプラグインの設定を書いてある
" 個人的なプラグイン周りの変更・追加は.vim/plug.vimへ
"
"---------------------------------------------------------
" [プラグイン名]
" : プラグインの概要
" プラグインの設定
"---------------------------------------------------
"[Shougo/dein]
" : neovim環境で動作するプラグイン管理環境を提供する
" : 設定ファイル用の記述言語tomlに書かれたプログラムをvimscriptに変換する機能を持つ
" : プラグインのキャッシュを読み込むことで動作を軽くする

"---------------------------------------------------
"[Shougo/vimproc]
" : shougo氏が作ったプラグインを高速化する
" : vimshellを使用するためには必須
" : 仮想化が関係しているらしい
" : Shougo/wimshellのディレクトリでmakeする必要がある

"---------------------------------------------------
"[Shougo/vimshell.vim]
" : ":vimshell"をうって使う。vim上で端末を操作できるようになる。
" : 重度のvimmer用なのでは?

"---------------------------------------------------
"['rhysd/accelerated-jk']
" : jとkでの移動を素早くする
    nmap j <Plug>(accelerated_jk_gj)
    nmap k <Plug>(accelerated_jk_gk)
"---------------------------------------------------
"[osyo-manga/vim-anzu]
" : /や?での検索ヒット時に、現在の検索位置を表示する
    " mapping
    " when you want to display it in screen,change this
        if 1    " if 1
            nmap n <Plug>(anzu-n-with-echo)
            nmap N <Plug>(anzu-N-with-echo)
        else    " if 0
            nmap n <Plug>(anzu-mode-n)
            nmap N <Plug>(anzu-mode-N)
        endif
        nmap * <Plug>(anzu-star-with-echo)
        nmap # <Plug>(anzu-sharp-with-echo) 
    " clear status
        nmap <Esc><Esc> <Plug>(anzu-clear-search-status)
    " statusline
        set statusline=%{anzu#search_status()}
    " comment :
    "           if you search 'word', word(12/51) in command line
"---------------------------------------------------
"['haya14busa/incsearch.vim']
" : 検索時に、対象文字列をハイライトする
    nmap / <Plug>(incsearch-forward)
    map ? <plug>(incsearch-background)
    map g/ <plug>(incsearch-stay)
    " comment : give color to some search word
"---------------------------------------------------
"['vim-scripts/autodate.vim']
" : タイムスタンプの自動更新
" : Last Change : . みたいにしてやるよ
    let autodate_keyword_pre="Date      : "
    let autodate_keyword_post="."
"    let autodate_lines=100
"    let autodate_start_line=-1
    let autodate_format="%Y/%m/%d"
"---------------------------------------------------
"['osyo-manga/vim-over']
" : 置換時に、対象文字列をハイライトする
    " command : when you '%s/word1/word2/g', 
    "           paint ward after ':OverCommandLine'!
"---------------------------------------------------
"['ConradIrwin/vim-bracketed-paste']
" : ペーストするときにpastemodeにする
" : これによってネットのプログラムをコピペするときにインデントされるのを防ぐ
"---------------------------------------------------
"['scrooloose/nerdcommenter']
" : コメントアウトプラグイン
"---------------------------------------------------
"['scrooloose/nerdtree']
" : ディレクトリのツリー表示
    "https://kamiya555.github.io/2015/10/14/nerdtree-command/

    " NERDTress File highlighting
    function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
    endfunction
    call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
    call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
    call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
    call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
    call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
    call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
    call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
    call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
    call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
    call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
    call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
    call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')

