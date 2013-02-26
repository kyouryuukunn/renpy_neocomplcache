complete RenPy language by vim and neocomplcache

vimとneocomplcacheを使ってRen'Pyの補完をするプラグイン
設定によりユーザー定義トランジション、変換、画像タグ、画像属性も補完出来る
また、ATLも認識する。
詳しくは ブログへhttp://akakyouryuu.blog.fc2.com/blog-entry-9.html


require:
    neocomplcache

setting:
    let g:renpy_image = {'imagetag' : ['imageattrubute',  ...], ... }
    let g:renpy_transform  = ['your defined transform', ...]
    let g:renpy_transition = ['your defined transition', ...]
