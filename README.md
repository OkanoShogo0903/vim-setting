## vim_settings
わたくしの設定ファイルをそのまま載せてあります.
自由にpullして自分仕様の設定に書き換えればいいんじゃないでしょうか.

余談ですが、ここ最近は夢の中にもvimが出始めてきました.
もう病気だと思います.

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

3. わたくしの設定ファイルをダウンロード

    ```
    git clone https://github.com/OkanoShogo0903/vim_settings.git
    ```

4. わたくしの設定ファイルをインストール
    neovimの設定
    シンボリックリンクの作成、パスの設定とかをします.

    ```
    mkdir ~/.config/nvim
    cp ~/vim_settings/etc/vimrc_sample ~/.vimrc
    ln -s ~/.vimrc ~/.config/nvim/init.vim
    ```

5. プラグインのインストール
    インターネットに繋がった状態で、端末に`nvim`と打ち込む.
    自動的にインストールが始まります.
    インストール中に[継続]という表示が出てきたらEnterを押して下さい.


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

