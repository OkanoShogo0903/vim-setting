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
インターネットに繋がっていることを前提にしているので、インストールを始める前にまずネットにつながるようにして下さい。

1. Gitインストール
    新しい端末で、

    ```
    git config --global http.proxy wwwproxy.kanazawa-it.ac.jp:8080

    sudo apt-get install
    sudo apt-get install git
    ```

1. Git使って設定ファイルをダウンロード

    ```
    git clone https://github.com/WinKIT/vim_settings.git
    ```

2. NeoVimインストール
    NeoVimはUbunto 12.04以降で使えます
    ホームディレクトリで行いましょう

    ```
    sudo apt-get install libtool autoconf automake cmake libncurses5-dev g++ pkg-config
    git clone https://github.com/neovim/neovim.git
    (結構時間がかかります。clone into neovim...で止まる場合は先輩に相談して。)
    cd neovim
    make
    (makeも2,3分程度かかるのでトイレでも行ってきて下さい)
    sudo make install
    ```

3. Dein
    1. シンボリックリンクの作成
    ここではリンクを貼っていきます。Pathの関係でそのまま打っていって下さい。

    ```
    mkdir ~/.vim
    mv ~/.vimrc ~/.vimrc_origin
    ln -sf ~/vim_settings/.vimrc ~/.vimrc
    ln -sf ~/vim_settings/.vimrc ~/.nvimrc
    ln -sf ~/vim_settings/colors ~/.vim/colors  
    ```
    2. 関連ファイルの作成

    ```
    cp ~/vim_settings/etc/basic.vim ~/.vim/basic.vim
    cp ~/vim_settings/etc/plug.vim ~/.vim/plug.vim
    cp ~/vim_settings/etc/my_dein.toml ~/.vim/my_dein.toml
    ```

3.3. Deinインストール
    インターネットに繋がった状態で端末にviと打ち込んで下さい。
    自動的にインストールが始まります。(所要時間は2,3分程度)
    インストール中に[継続]という表示が出てくるので、出てくるたびにEnterを押して下さい。
    これで終了です、お疲れ様でした。


- 追記
操作方法についてですが、~/dotfileに操作方法を記したチートシートと動画がおいてあるのでそれも見て下さい。

## Q&A
無線でgithubを利用するためのプロキシ設定

```
git config --global http.proxy wwwproxy.kanazawa-it.ac.jp:8080
```
