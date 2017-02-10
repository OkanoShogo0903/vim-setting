if &t_Co > 1
	    syntax enable
"colorscheme-----------------
	    colorscheme monokai
	    ""colorscheme kitchen
	
	    "colorscheme molokai
	    "let g:molokai_original = 1
	    "let g:rehash256 = 1
	    
	    "colorscheme badwolf
	    "highlight Normal ctermbg=none
	    "colorscheme goodwolf
"other-----------------------
	    set hlsearch
	    set smarttab
	    set tabstop=4
	    set ts=4
	    set shiftwidth=4
	    set expandtab	"make 'tab' 'space' for color indent custom

	    syntax on
	    set nobackup
	    set number
	    set encoding=utf-8
	    set fileencoding=utf-8
	    set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
	    set autoindent
	    set incsearch
	    set ignorecase
	    set showmatch
	    set matchtime=1
	    set showmode
	    set title
	    set ruler
	    set display=lastline
	    set pumheight=8
	    
	    nmap <Esc><Esc> :nohlsearch<CR><Esc>
	    noremap Y y$
	    nnoremap \ #
	    nnoremap ^ $
"		nnoremap <C-^> ^
"
        inoremap { {}<Left>
        inoremap [ []<Left>
        inoremap ( ()<Left>
        inoremap " ""<Left>
        inoremap ' ''<Left>
        inoremap < <><Left>
        ""imap / //<Left>
        
        
endif

"^[$B>!<j$KDI2C!!KLLn^[(B
"move cursor the last edit part-----------------------------
if has("autocmd")
    	filetype plugin indent on
    	autocmd BufReadPost *
	            \ if line("'\"") > 0 && line("'\"") <= line("$") |
	            \ exe "normal g'\"" |
	            \ endif
endif

set laststatus=2
" for ZenkakuSpace -----------------------------------------
" 全角スペースの表示
" http://inari.hatenablog.com/entry/2014/05/05/231307
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
        augroup ZenkakuSpace
            autocmd!
            autocmd ColorScheme * call ZenkakuSpace()
            autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
        augroup END
        call ZenkakuSpace()
endif

"予測変換-------------------------------------------
"URL : http://io-fia.blogspot.jp/2012/11/vimvimrc.html
set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
	exec "imap " . k . " " . k . "<C-N><C-P>"
endfor
imap <expr> <TAB> pumvisible() ? "\<Down>" : "\<Tab>"

"dein Scripts---------------------------------------
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

"set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)
"~~~My Plugins here~~~
"	call dein#add({path to dein.vim directory})
	call dein#add('Shougo/neocomplete.vim')
	call dein#add('Shougo/deoplete.nvim')
	call dein#add('Shougo/unite.vim')
    call dein#add('haya14busa/incsearch.vim')
        nmap / <Plug>(incsearch-forward)
        map ? <plug>(incsearch-background)
        map g/ <plug>(incsearch-stay)
    call dein#add('vim-Scripts/AnsiEsc.vim')
    call dein#add('scrooloose/nerdtree')
"	call dein#add('')

	let g:rc_dir	= expand('~/.vim/rc')
	let s:toml		= g:rc_dir . '/dein.toml'
	let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

	call dein#load_toml(s:toml,			{'lazy': 0})
	call dein#load_toml(s:lazy_toml,	{'lazy': 1})

"~~~My plugin end~~~
	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on

"if you want to install not installed plugins on startup.
if dein#check_install()
	call dein#install()
endif

"End dein Scripts --------------

"indent color

"インデントに色を付けて見やすくする
"NeoBundle 'nathanaelkane/vim-indent-guides'

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
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
            
