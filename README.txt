complete RenPy language by vim and neocomplcache

This plugin completes RenPy language by vim and neocomplcache.
This recognizes ATL and screen block.

vimとneocomplcacheを使ってRen'Pyの補完をするプラグイン
設定によりユーザー定義トランジション、変換、画像タグ、画像属性も補完出来る
また、ATL,screenブロックも認識する。
詳しくは ブログへhttp://akakyouryuu.com


require:
    neocomplcache

config:
    let g:renpy_image      = {'imagetag': ['imageattrubute', ...], ... }
    let g:renpy_music      = [{'word': 'your music file'         , 'menu': 'explain it if you want'}, ...]
    let g:renpy_transition = [{'word': 'your defined transition' , 'menu': 'explain it if you want'}, ...]
    let g:renpy_transform  = [{'word': 'your defined transform'  , 'menu': 'explain it if you want'}, ...]
