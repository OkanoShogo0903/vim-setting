## vim_settings
  vimは最高のテキストエディタですが、CUIのとっつきにくさのために敬遠されがちです。

そのため、できるだけ分かりやすく使いやすいをテーマにしました。

  プラグインで必要なEXコマンド(:wとか)をキーに割り当てるなど、覚えなければいけないことはなるべく少なくしています。

最低限のvimの操作方法は覚えてもらうしかありませんので、チートシートを見ながら覚えてください。

## ファイル、ディレクトリの説明
* basic.vim

  基本設定

* plug.vim

  プラグインの設定

* dein.toml

    設定記述用の言語tomlでプラグイン設定を分離してる

* dein_lazy.toml

  dein.tomlより遅れたタイミングで読み込みたいものを記述してる

* etc
  
  初期設定で使うもの（個人のディレクトリに移して使うやつとか）が入ってる

* colors
  
  colorsheme用のデータある。みんなで追加していこう。

* snipmate
  
  スニペット機能で呼び出す定型文を入れてある

* dict

  辞書を登録できる

* ftdetect
  
  ファイルタイプを指定するためのファイルが入ってる

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
## Q&A
無線でgithubを利用するためのプロキシ設定

```
git config --global http.proxy wwwproxy.kanazawa-it.ac.jp:8080
```
