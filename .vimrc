
if &t_Co> 1
	    syntax enable
"==============================================
"個人用設定ファイルの読み込み
"userの名前で判別
"自分の設定ファイル作りたい方はどうぞ
"    if exists("$USER")
"        if $USER == 'okano'
"            source ~/dotfiles/okano.vimrc
"        endif
"    endif
    if filereadable(expand('~/.vim/subvimrc.vim'))
        source ~/.vim/subvimrc.vim
    endif
"==============================================
"colorscheme
"    source color.vimrc
        set hlsearch
	
        let monokai=0
        let molokai=1
        let kitchen=0
        let badwolf=0
        let goodwolf=0

"        colorscheme molokai
"	    if     g:sheme == 'molokai'
"	        let g:molokai_original = 1
"	        let g:rehash256 = 1
"	    elseif g:sheme == 'badwolf'
"	        highlight Normal ctermbg=none
 "       endif
        
        set t_Co=256
"==============================================
"syntax color   
	    syntax on

"==============================================
"tab   
	    set smarttab
	    set tabstop=4
	    set shiftwidth=4
	    set expandtab	"make 'tab' 'space' for color indent custom
        set shiftround

"==============================================
"edit
	    set autoindent
"       set smartindent
	    set ignorecase
	    set showmatch
	    set matchtime=1
"=============================================="search
	    set incsearch
"==============================================
"auto correct
        "limit of auto correct
	    set pumheight=8

        "paint auto correct
        "for vim7
        hi Pmenu        ctermfg=Black ctermbg=Grey
        hi PmenuSel     ctermbg=Blue
        hi PmenuSbar    ctermbg=Cyan

"==============================================
"display
	    set number
	    set title
	    set ruler
	    set display=lastline

"==============================================
"ステータスラインの色をノーマルモードと挿入モードで区別する
"guifg = FrontGround
"guibg = BackGround
"gui,cterm = BigChar, SlantingChar
"        au InsertEnter * hi statusLine guifg=DarkBlue guibg=DarkGray gui=none ctermfg=Blue ctermbg=DarkGray cterm=none
"        au InsertLeave * hi statusLine guifg=DarkBlue guibg=DarkGray gui=none ctermfg=Blue ctermbg=DarkGray cterm=none

"==============================================
"Character code
	    set encoding=utf-8
	    set fileencoding=utf-8
	    set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

"==============================================
"Back up
        set nobackup
"       noswapfile
"==============================================
"Other ???
	    set showmode
        set helplang=ja
"==============================================
"KeyMapping

    "誤動作予防
        nnoremap Q <Nop>
        nnoremap ZZ <Nop>
        nnoremap ZQ <Nop>
    
    "basic
	    nmap <Esc><Esc> :nohlsearch<CR><Esc>

        inoremap { {}<Left>
        inoremap [ []<Left>
        inoremap ( ()<Left>
        inoremap " ""<Left>
        inoremap ' ''<Left>
        inoremap < <><Left>
        "imap / //<Left>   // for rudy

        

    "move the display line-by-line
        nnoremap j gj
        nnoremap k gk
        vnoremap j gj
        vnoremap k gk

        nnoremap <silent><C-e> :NERDTree<CR>
    "???どっちか   
    "Alt key カーソル位置を移動する前に戻す
""        nnoremap <M-Right> <C-i>
""        nnoremap <M-Left> <C-o>

    "'Browser page reading short cut' application
        nnoremap <C-Up> gg
        nnoremap <C-Down> <S-g>
        "?コマンドは1種類
        ""nnoremap <Home> gg

"これを有効にすればCtrl+Tabが利用できるようになるが、別途インストールが必要なため、導入をしない。よってCtrl+Tabによるショートカットは利用しない
"        *vt100.translation: #override \n\
"            Ctrl ~Shift <Key>Tab: string(0x1b) string("[27;5;9~") \n \
"            Ctrl Shift <Key>Tab: string(0x1b) string("[27;6;9~") \n

    "Ctrl + Tab が使えないため、保留
        if 0
            nnoremap <C-w> :close<CR>
            nnoremap <C-Tab> :echo "bbb"<CR>
            nnoremap <C-Tab> <C-w><C-w>
        endif

        ""nnoremap <C-Tab> :echo "abc"<CR>

    "if サーチモードがオンの時のみにしたい
"        nmap <Tab> n
"        nmap <S-Tab> <S-n>
"       nnoremap <Tab> >>
"       nnoremap \<C-i> <C-i>

    "'Edit short cut' application
        nnoremap <C-z> u
"        inoremap <C-z> <Esc>ui
        nnoremap <C-y> <C-r>
"        inoremap <C-y> <Esc><C-r>
        nnoremap <C-f> /
        inoremap <C-f> <Esc>/

"        nnoremap <S-Up> v
"        nnoremap <S-Down> v
"v覚えてもらう
"        nnoremap <S-Left> v
"        nnoremap <S-Right> v

        nnoremap <C-s> :w
        xnoremap <C-x> d
        xnoremap <C-c> y
"        nnoremap <C-v> p
        inoremap <C-v> <Esc>pi

        noremap <C-a> ggVG
"数字指定してインデントする
        xnoremap <Tab> >
        xnoremap <S-Tab> <
        
""        nnoremap <S-Space> 
""        nnoremap <Space> 

endif
"-----------------------------------------------------------
"^[$B>!<j$KDI2C!!KLLn^[(B
"move cursor the last edit part
if has("autocmd")
    	filetype plugin indent on
    	autocmd BufReadPost *
	            \ if line("'\"") > 0 && line("'\"") <= line("$") |
	            \ exe "normal g'\"" |
	            \ endif
endif

set laststatus=2
"----------------------------------------------------------
" 全角スペースの表示 for ZenkakuSpace
" 名無しのvim使いさん著、Vimテクニックバイブルp43参照
scriptencoding utf-8
augroup highlightIdegraphicSpace
    autocmd!
    autocmd ColorScheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
    autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

"これ以降でカラースキーム設定しなければ、エラーが出るらしい"
"---------------------------------------------------------
"予測変換 auto correct indicater
"URL : http://io-fia.blogspot.jp/2012/11/vimvimrc.html
"補完候補が一つでもポップアップ表示
"set completeopt=menuone
"文字列を一文字ずつ分割して文字のリストにする
"for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
"	exec "imap " . k . " " . k . "<C-N><C-P>"
"endfor
"imap <expr> <TAB> pumvisible() ? "\<Down>" : "\<Tab>"

"---------------------------------------------------------
"dein Scripts
if &compatible
	set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')
"" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
	if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
	endif
	execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

colorscheme monokai
"if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)
"~~~My Plugins here~~~
"	call dein#add({path to dein.vim directory})

    call dein#add('Shougo/neocomplcache')
        let g:acp_enableAtStartup = 0
        let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_enable_smart_case = 1
        let g:neocomplcache_min_syntax_length = 3
        let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
    

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

    call dein#add('Shougo/vimshell.vim')
    " comment : ':VimShell'
    call dein#add('Shougo/vimproc')
    " comment : vimの高速化

   call dein#add('Shougo/neosnippet')
   call dein#add('Shougo/neosnippet-snippets')

        imap <C-k>     <Plug>(neosnippet_expand_or_jump)
        smap <C-k>     <Plug>(neosnippet_expand_or_jump)

        "SuperTab like snippets behavior.
        imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
        smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
        
        " For snippet_complete marker.
        if has('conceal')
            set conceallevel=2 concealcursor=i
        endif

        let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'hentai' : $HOME.'/dotfiles/dict/hentai.dict',
            \ }
        let g:neosnippet#snippets_directory = '~/dotfiles/snipmate/'
    
    call dein#add('haya14busa/incsearch.vim')
        nmap / <Plug>(incsearch-forward)
        map ? <plug>(incsearch-background)
        map g/ <plug>(incsearch-stay)
    " comment : give color to some search word

    call dein#add('vim-Scripts/AnsiEsc.vim')
    " comment : color log file 

    call dein#add('scrooloose/nerdtree')
    " comment : it is the God Plugin
    "           let ':NERDTree'!!
    
    call dein#add('scrooloose/nerdcommenter')

    call dein#add('osyo-manga/vim-anzu')
    " mapping
    " when you want to display it in screen,change this
        if 0    " if 1
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

    call dein#add('osyo-manga/vim-over')
    " command : when you '%s/word1/word2/g', 
    "           paint ward after ':OverCommandLine'!
    call dein#add('nathanaelkane/vim-indent-guides')
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
    "set background=dark

"    call dein#add('Shougo/denite.nvim')
    "unite reinforce

"	call dein#add('')
" --- Please add new plugin ---

	let g:rc_dir	= expand('~/.vim/rc')
	let s:toml		= g:rc_dir . '/dein.toml'
	let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

	call dein#load_toml(s:toml,			{'lazy': 0})
	call dein#load_toml(s:lazy_toml,	{'lazy': 1})

"~~~My plugin end~~~
	call dein#end()
	call dein#save_state()
"endif

filetype plugin indent on

"if you want to install not installed plugins on startup.
if dein#check_install()
	call dein#install()
endif
        
"-----------------------------------------------------------
