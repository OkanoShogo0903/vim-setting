"---------------------------------------------------------
" Robocup's .vimrc
" 
" プラグイン管理にdein.nvimを使うため、neovimを入れている
" セットアップの方法についてはドリームラボ参照
"
" 個人の設定は ~/.vim/basic.vim
" 個人のプラグイン設定は ~/.vim/plug.vim と ~/.vim/rc/mydein.toml
" 
" ロボカップ全体の設定は ~/dotfiles/basic.vim
" ロボカップ全体のプラグイン設定は ~/dotfiles/plug.vim と ~/.v
"---------------------------------------------------------

"dein Scripts
if &compatible
	set nocompatible
endif

let s:dein_dir = expand('~/.vim/plugins')
"" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
	if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
	endif
	execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

    "個人でプラグイン入れたいときはdein_sourceにvimscriptで書いてもらう
    let s:dein_source = expand('~/dotfiles/etc/dein_source.vim')
    if filereadable(expand('s:dein_source'))
        source s:dein_source
    endif

	let g:rc_dir	= expand('~/.vim/rc')
	let s:toml		= g:rc_dir . '/dein.toml'
	let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

	call dein#load_toml(s:toml,			{'lazy': 0})
	call dein#load_toml(s:lazy_toml,	{'lazy': 1})

	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on

"if you want to install not installed plugins on startup.
if dein#check_install()
	call dein#install()
endif

"-----------------------------------------------------------
"Read script about Plugin
"
"let g:dot_dir	= expand('~/dotfile')
"let s:dot_toml		= g:dot_dir . '/dein.toml'
"let s:dot_lazy_toml = g:dot_dir . '/dein_lazy.toml'
"let s:dot_plug = g:dot_dir . '/plug.vim'
"let s:dot_basic = g:dot_dir . '/basic.vim'

if filereadable(expand('~/dotfiles/plug.vim'))
    source ~/dotfiles/plug.vim
endif
if filereadable(expand('~/dotfiles/etc/plug.vim'))
    source ~/dotfiles/etc/plug.vim
endif

"-----------------------------------------------------------
"Read script about exept Plugin

if filereadable(expand('~/dotfiles/basic.vim'))
    source ~/dotfiles/basic.vim
endif

if filereadable(expand('~/dotfiles/etc/basic.vim'))
    source ~/dotfiles/etc/basic.vim
endif

"-----------------------------------------------------------
"subvimrc : running test
if filereadable(expand('~/.vim/subvimrc.vim'))
    source ~/.vim/subvimrc.vim
endif

