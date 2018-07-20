if has('nvim')
    if !&compatible
    set nocompatible
    endif

    " reset augroup
    augroup MyAutoCmd
    autocmd!
    augroup END

    " dein settings {{{
    " dein自体の自動インストール
    let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
    let s:dein_dir = s:cache_home . '/dein'
    let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
    endif
    let &runtimepath = s:dein_repo_dir .",". &runtimepath
    " プラグイン読み込み＆キャッシュ作成
    let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
    let s:lazy_toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein_lazy.toml'
    if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    call dein#load_toml(s:toml_file)
    call dein#load_toml(s:lazy_toml_file)
    call dein#end()
    call dein#save_state()
    endif
    " 不足プラグインの自動インストール
    if has('vim_starting') && dein#check_install()
    call dein#install()
    endif
    " }}}

    "-----------------------------------------------------------
    let g:python_host_prog=$PYENV_ROOT.'/versions/neovim-2/bin/python'
    let g:python3_host_prog=$PYENV_ROOT.'/versions/neovim-3/bin/python'

    "set runtimepath+=~/vim_settings/
    "runtime! etc/*.vim 

    tnoremap <silent> jj <C-\><C-n>
    tnoremap <silent> <ESC> <C-\><C-n>
endif

"===========================================================
"Read script about exept Plugin

"if filereadable(fnamemodify(expand('<sfile>'), ':h').'/basic.vim')
"   source fnamemodify(expand('<sfile>'), ':h').'/basic.vim'
if filereadable(expand('~/vim_settings/basic.vim'))
    source ~/vim_settings/basic.vim
else
    echo "ERR basic.vim"
endif
