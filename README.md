## vim-setting
わたくしの設定ファイルをそのまま載せてあります.
自由にpullして自分仕様の設定に書き換えればいいんじゃないでしょうか.

余談ですが、ここ最近は夢の中にもvimが出始めてきました.
もう病気だと思います.

Neovimのインストールについてですが、  
以外に前提知識(pyenv, .bash系)がないとつまずくかもしれません.  
ちなみに自分は3回目のインストールで1時間ほどかかりました.        

## NeoVimInstall 
NeoVimはUbunto 12.04以降で使えます.
インターネットに繋がっていることを前提にしているので、インストールを始める前にまずネットにつながるようにして下さい.

1. Gitインストール

    ```
    git config --global http.proxy wwwproxy.kanazawa-it.ac.jp:8080

    sudo apt-get install
    sudo apt-get install git
    ```

2. NeoVimインストール
    方法はいつくかありますが、そのうち２つをここに示します。
    1. ソースからmakeする方法(ubuntu14.04で実績あり)

    ホームディレクトリで、以下のコードを実行

    ```
    sudo apt-get install libtool autoconf automake cmake libncurses5-dev g++ pkg-config
    git clone https://github.com/neovim/neovim.git
    (結構長い)
    cd neovim
    make
    (makeも2,3分程度かかる)
    sudo make install
    ```
    2. ppaからapt-getでいれる方法(ubuntu16.04で実績あり)
    [ここ](https://github.com/neovim/neovim/wiki/Installing-Neovim)のinstall-ubuntuのとこ読んで.

3. わたくしの設定ファイルをダウンロード

    ```
    git clone https://github.com/OkanoShogo0903/vim-setting.git
    ```

4. わたくしの設定ファイルをインストール
    neovimの設定
    シンボリックリンクの作成、パスの設定とかをします.

    ```
    mkdir ~/.config/nvim
    cp ~/vim_setting/etc/vimrc_sample ~/.vimrc
    ln -s ~/.vimrc ~/.config/nvim/init.vim
    ```


## neovim初期設定編
nvimで`:CheckHealth`すると、エラー出るはず.
python2,3のパスの問題なので、これをクリアします.
ちなみにこの記事は[このサイト](https://qiita.com/yuku_t/items/6db331e7084f88b43fe4)を参考にして書いてる.
[このサイト](https://qiita.com/shigechioyo/items/198211e84f8e0e9a5c18)を参考にしてpyenvいれる.
ここでpyenvによってpythonの2系と3系を用意する.
ここから先は`python2.7.15`と`python3.6.6`を入れているが、別のヴァージョンでもよいので別のを入れるときは脳内置換してどうぞ.
```
pyenv install 2.7.15
pyenv install 3.6.6
```
確認は、`pyenv versions`でできる.

```
$ pyenv virtualenv 2.7.15 neovim-2
$ pyenv shell neovim-2 
$ pip install neovim
$ pyenv virtualenv 3.6.6 neovim-3
$ pyenv shell neovim-3
$ pip install neovim
```
nvimで`:CheckHealth`してみて、エラーでるか確認して.

## hoge
shougoプラグインには、設定を読みこませるためのコマンドとして`:UpdateRemotePlugins`が用意されてます.
とりあえずこれを打ち込んで、<C-u><C-u>とかしてdeniteが動くかどうか確かめてみて.


## neovimの本来の設定ファイルの場所
`$HOME/.config/nvim/init.vim` <--- これがデフォルトで読み込まれる

## ファイル、ディレクトリの説明
* basic.vim
  nvimでもvimでも読み込まれるよう基本設定がはいっている(`if has('nvim')`)

* dein.toml
  設定記述用の言語tomlでプラグイン設定を分離してる

* dein_lazy.toml
  dein.tomlより遅れたタイミングで読み込みたいものを記述してる

* etc
  初期設定で使うもの

* colors
  colorshemeがいろいろ入ってる
  runtimeで設定されているパスから`/colors/*.vim`に該当するものをカラースキームとして読み込むようになってる

* snipmate
  スニペット機能で呼び出す定型文を入れてある

* dict
  辞書を登録できる

* ftdetect
  ファイルタイプを指定するためのファイルが入ってる


## Q&A
無線でgithubを利用するためのプロキシ設定

```
git config --global http.proxy wwwproxy.kanazawa-it.ac.jp:8080
```

