"---------------------------------------------------------
" my basic
" 
" 個人の設定を書く場所
" 
" vimscriptで書いてね
" ~/dotfiles/basic.vim みれば大体の書き方は分かると思う
" 書き方がわからない場合は「vimrc」等で検索すればいろいろでてくるはず
"---------------------------------------------------------
"colorscheme
"    好きなカラースキームを有効にしよう
    colorscheme default

    colorscheme molokai
"    colorscheme monokai
"    colorscheme badwolf
"    colorscheme goodwolf
"    colorscheme kitchen
"    colorscheme shine
"    colorscheme tender
"    colorscheme pencil
"    colorscheme kalisi
"    colorscheme moonshine_minimal
"    colorscheme moonshine_lowcontrast

" 背景を透けさせる
"    highlight Normal ctermbg=none
"---------------------------------------------------------
"auto correct
        "limit of auto correct
	    set pumheight=8

        "paint auto correct
        "for vim7
        hi Pmenu        ctermfg=Black ctermbg=Grey
        hi PmenuSel     ctermbg=Blue
        hi PmenuSbar    ctermbg=Cyan

