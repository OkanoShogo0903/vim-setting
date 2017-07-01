# 問題の発見と解決のメモ
発見された問題とそれへの対応方法をメモとしてまとめておきます
引き継ぐ開発者、もしくは熟練した使用者になぜ今の仕様になっているかを知らせるためのものです
************
* neocomplcacheをEnable、Disableにしたときにエラーが起こる問題
  neocomplcacheのフォルダの中身を置く場所が間違っていた。
  <https://chocoby.jp/blog/2010/08/18/neocomplcache-vim/>
  
* 補完のせいで入力できなくなる不具合
  abcdefghij...の補完機能が有効になっていたことが原因と思われる(川崎さん調べ)
  該当コードを削除して対応

* 補完のオンオフを行いたい
  :NeoComplCacheDisableと:NeoComplCacheEnabkeコマンドでできることを伝えた。
