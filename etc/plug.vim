"---------------------------------------------------------
" My plugin
" 
" 個人用のプラグインの設定を書く場所
" ステータスバーの色とか、補完周りのキーマッピングとか、個人の好みによって変えたくなる部分をロボカップ標準の設定から切り離してここに設置した。
"
" 個人で追加したいプラグインがあるときは、ここにあるサンプルを参考にして追加していってね
" 
"---------------------------------------------------------
" [プラグイン名]
" : プラグインの概要
" プラグインの設定

"---------------------------------------------------
"[vim-airline/vim-airline]
"[vim-airline-themes]
" : ファイルの情報が書いてあるバーを表示する
" : いろいろ変えて遊べる
" : ぜひお気に入りを探してみてほしい
" : https://github.com/vim-airline/vim-airline/wiki/Screenshots

"let g:airline_theme = 'molokai'
"let g:airline_theme = 'luna'
"let g:airline_theme = 'bubblegum'
"let g:airline_theme = 'sol'
"let g:airline_theme = 'papercolor'
"let g:airline_theme = 'base16'
let g:airline_theme = 'behelit'
"let g:airline_theme = 'jellybeans'
"let g:airline_theme = 'luna'
"let g:airline_theme = 'tomorrow'

"---------------------------------------------------
"[Shougo/neocomplcache]
" : 入力補完用プラグイン

    "インサートモードで移動中に候補選択しない
"    let g:NeoComplCache_TagsAutoUpdate = 1  
"    let g:NeoComplCache_EnableInfo = 1  
"    let g:NeoComplCache_EnableCamelCaseCompletion = 1  
"    let g:NeoComplCache_EnableSkipCompletion = 1  
"    let g:NeoComplCache_SkipInputTime = '0.5'  
"    inoremap  pumvisible() ? neocomplcache#close_popup()."\" : "\"  
"    inoremap  pumvisible() ? neocomplcache#close_popup()."\" : "\"  

"    let g:neocomplcache_enable_insert_char_pre = 1
    
    "基本設定
    let g:acp_enableAtStartup = 0
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_smart_case = 1
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

    " 一番目の候補を自動選択
    let g:neocomplcache_enable_auto_select = 0
    " 補完候補の数
    let g:neocomplcache_max_list = 5
    " 選択して改行されないようにする
    inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"
    "" <TAB>: completion.
    inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    "" <C-h>, <BS>: close popup and delete backword char.
"---------------------------------------------------
"[Shougo/neosnippet]
"[Shougo/neosnippet-snippets]
" : 「スニペット」: 定型文
" : neocomplcache等のShougo氏作成の補完系プラグインが必須
" : ~/dotfiles/dictで辞書登録してる
" : http://kazuph.hateblo.jp/entry/2013/01/19/193745
    " <TAB>: completion.
    " inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
    
    " Plugin key-mappings
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    
    " SuperTab like snippets behavior.
    " imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
    imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
        
    " For snippet_complete marker.
    if has('conceal')
        set conceallevel=2 concealcursor=i
    endif

    let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'robocup' : $HOME.'/dotfiles/dict/robocup.dict',
        \ }
    let g:neosnippet#snippets_directory = '~/dotfiles/snipmate/'

"---------------------------------------------------
"['scrooloose/nerdtree']
" : ディレクトリのツリー表示
    "https://kamiya555.github.io/2015/10/14/nerdtree-command/
    " 隠しファイルをデフォルトで表示させる
    let NERDTreeShowHidden = 1

    " ブックマークを初期表示
    let g:NERDTreeShowBookmarks=1

    " デフォルトでツリーを表示させる
    "autocmd VimEnter * execute 'NERDTree'

    " ファイル名指定しなかった場合はデフォルトでNERDTREE表示
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"---------------------------------------------------
"['nathanaelkane/vim-indent-guides']
" : インデントを可視化する
    "indent color
    "インデントに色を付けて見やすくする
    
    "vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
    let g:indent_guides_enable_on_vim_startup = 1
    "自動カラー無効
    let g:indent_guides_auto_colors = 0
    "偶数行と奇数行の色を設定
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=black "3
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray "4
    "何行目から色付けを行うかを指定する
    let g:indent_guides_start_level = 2
    "可視化領域のサイズを指定
    let g:indent_guides_guide_size = 1

"---------------------------------------------------
" タイムライン選択用の Unite を起動する
nnoremap <silent> t :Unite tweetvim<CR>
" 発言用バッファを表示する
"nnoremap <silent> s           :<C-u>TweetVimSay<CR>
" mentions を表示する
"nnoremap <silent> <Space>re   :<C-u>TweetVimMentions<CR>
" 特定のリストのタイムラインを表示する
nnoremap <silent> <Space>tt   :<C-u>TweetVimListStatuses basyura vim<CR>

" スクリーン名のキャッシュを利用して、neocomplcache で補完する
if !exists('g:neocomplcache_dictionary_filetype_lists')
  let g:neocomplcache_dictionary_filetype_lists = {}
endif
let neco_dic = g:neocomplcache_dictionary_filetype_lists
let neco_dic.tweetvim_say = $HOME . '/.tweetvim/screen_name'
"---------------------------------------------------
"[]
" : 
" : 
"---------------------------------------------------
"[]
" : 
" : 
"---------------------------------------------------
"call dein#addでプラグインを入れるときのサンプル
"この方法だと入れるのが楽。ただし数が増えるとtomlで書くよりも若干遅くなる。若干。

"    call dein#add('Shougo/neocomplete.vim')
    " comment : vim7.3以上かつ、luaが導入されていることが必要
"   " comment : need lcd 
"               vim用の補完プラグイン
"               (sudo apt-get install lua5.2)でもluaが有効にならなかった

"	call dein#add('Shougo/deoplete.nvim')
"	" comment : neovim用の補完プラグイン
"	            ソースファイルはpython3で書く
"	            python3の難易度はかなり低く、サンプルを見れば書き換え可能とのこと

"	call dein#add('Shougo/unite.vim') 
    " comment : need python3 install
    "           ファイルの操作をvimでやる

" --- Please add new plugin ---

" **********追加したいプラグインは下に追加していこう************
"	call dein#add({path to dein.vim directory})

"	call dein#add('')

