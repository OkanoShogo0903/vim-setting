"---------------------------------------------------------
" Robocup basic
" 
" ロボカップ標準のmapping等の設定を書いてある
" 
"---------------------------------------------------------
"colorscheme
    syntax enable
"    source color.vimrc
        set hlsearch

        let monokai=0
        let molokai=1
        let kitchen=0
        let badwolf=0
        let goodwolf=0

"        let s:scheme = molokai
"	    execute 'colorscheme ' . s:scheme 
"	    execute 'colorscheme ' . fnamemodify(molokai, ':p')
"        execute colorscheme fnamemodify(g:scheme, ':p')

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

"-----------------------------------------------------------
"カーソル位置の保存
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


