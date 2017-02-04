if &t_Co > 1
        syntax enable
		"colorscheme monokai
        "colorscheme molokai
		"let g:molokai_original = 1
		"colorscheme badworf
		set hlsearch
        set tabstop=4
        set ts=4
        set shiftwidth=4
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
		
		nmap <Esc><Esc> :nohlsearch<CR><Esc>
		nnoremap \ #
		nnoremap Y y$
endif

"^[$B>!<j$KDI2C!!KLLn^[(B
if has("autocmd")
        filetype plugin indent on
        autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \ exe "normal g'\"" |
                \ endif
endif

set laststatus=2

