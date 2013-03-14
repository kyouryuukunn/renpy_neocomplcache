" plugin for neocomplcache <http://github.com/Shougo/neocomplcache>
"

let s:source = {
      \ 'name' : 'renpy_complete',
      \ 'kind' : 'ftplugin',
      \ 'filetypes': { 'renpy': 1 },
      \ }

function! s:source.initialize() " {{{
  if !exists('g:renpy_transform')
          " let g:renpy_transform = [{'word': 'sample'}]
          let g:renpy_transform = []
  endif
  if !exists('g:renpy_transition')
          " let g:renpy_transition = [{'word': 'sample'}]
          let g:renpy_transition = []
  endif
  if !exists('g:renpy_music')
          " let g:renpy_music = [{'word': 'sample'}]
          let g:renpy_music = []
  endif
  if !exists('g:renpy_image')
          " let g:renpy_image = {'imagetag': ['imageattribute']}
          let g:renpy_image = {}
  endif
  let s:imagetag_list = []
  for l:imagetag in keys(g:renpy_image)
    call add(s:imagetag_list , {'word': l:imagetag})
  endfor
endfunction " }}}

function! s:source.finalize()
endfunction

function! s:source.get_keyword_pos(cur_text) "{{{
	" 規定の空白以外の文字を入力後に呼ばれる
  if neocomplcache#within_comment()
    return -1
  endif
	if a:cur_text =~ '.*\w\+ \+'
		" echo matchend(a:cur_text, '.* ')
		return matchend(a:cur_text, '.* ') " 単語の後の空白
	else
		" echo matchend(a:cur_text, '^ *')
		return matchend(a:cur_text, '^ *') " 空白を除いた先頭
  endif
endfunction "}}}

function! s:source.get_complete_words(cur_keyword_pos, cur_keyword_str) "{{{
  let l:list = []
  let l:line = strpart(getline('.'), 0, getpos('.')[2]-1)

	if l:line =~ '"'
		return -1
	elseif s:checkATL()
 "{{{ ATL
   "{{{ with transition (with #)
    if l:line =~ 'with\s\+\w*$'
      call add(l:list , {'word': 'dissolve'           , 'menu': ''})
      call add(l:list , {'word': 'fade'               , 'menu': ''})
      call add(l:list , {'word': 'move'               , 'menu': ''})
      call add(l:list , {'word': 'ease'               , 'menu': ''})
      call add(l:list , {'word': 'vpunch'             , 'menu': ''})
      call add(l:list , {'word': 'hpunch'             , 'menu': ''})
      call add(l:list , {'word': 'blinds'             , 'menu': ''})
      call add(l:list , {'word': 'squares'            , 'menu': ''})
      call add(l:list , {'word': 'pixellate'          , 'menu': ''})

      call add(l:list , {'word': 'wiperight'          , 'menu': ''})
      call add(l:list , {'word': 'wipeleft'           , 'menu': ''})
      call add(l:list , {'word': 'wipeup'             , 'menu': ''})
      call add(l:list , {'word': 'wipedown'           , 'menu': ''})

      call add(l:list , {'word': 'slideright'         , 'menu': ''})
      call add(l:list , {'word': 'slideleft'          , 'menu': ''})
      call add(l:list , {'word': 'slideup'            , 'menu': ''})
      call add(l:list , {'word': 'slidedown'          , 'menu': ''})

      call add(l:list , {'word': 'slideawayright'     , 'menu': ''})
      call add(l:list , {'word': 'slideawayleft'      , 'menu': ''})
      call add(l:list , {'word': 'slideawayup'        , 'menu': ''})
      call add(l:list , {'word': 'slideawaydown'      , 'menu': ''})

      call add(l:list , {'word': 'easeintright'       , 'menu': ''})
      call add(l:list , {'word': 'easeintleft'        , 'menu': ''})
      call add(l:list , {'word': 'easeintup'          , 'menu': ''})
      call add(l:list , {'word': 'easeintdown'        , 'menu': ''})

      call add(l:list , {'word': 'easeoutright'       , 'menu': ''})
      call add(l:list , {'word': 'easeoutleft'        , 'menu': ''})
      call add(l:list , {'word': 'easeoutup'          , 'menu': ''})
      call add(l:list , {'word': 'easeoutdown'        , 'menu': ''})


      call add(l:list , {'word': 'moveintright'       , 'menu': ''})
      call add(l:list , {'word': 'moveintleft'        , 'menu': ''})
      call add(l:list , {'word': 'moveintup'          , 'menu': ''})
      call add(l:list , {'word': 'moveintdown'        , 'menu': ''})

      call add(l:list , {'word': 'moveoutright'       , 'menu': ''})
      call add(l:list , {'word': 'moveoutleft'        , 'menu': ''})
      call add(l:list , {'word': 'moveoutup'          , 'menu': ''})
      call add(l:list , {'word': 'moveoutdown'        , 'menu': ''})

      call add(l:list , {'word': 'irisout'            , 'menu': ''})
      call add(l:list , {'word': 'irisin'             , 'menu': ''})


      call add(l:list , {'word': 'zoomout'            , 'menu': ''})
      call add(l:list , {'word': 'zoomin'             , 'menu': ''})
      call add(l:list , {'word': 'zoominout'          , 'menu': ''})

      call add(l:list , {'word': 'AlphaDissolve'      , 'menu': 'AlphaDissolve(control, delay=0.0, alpha=False, reverse=False)'})
      call add(l:list , {'word': 'ComposeTransition'  , 'menu': 'ComposeTransition(trans, before, after)'})
      call add(l:list , {'word': 'CropMove'           , 'menu': 'CropMove(time, mode="slideright", startcrop=(0.0, 0.0, 0.0, 1.0), startpos=(0.0, 0.0), endcrop=(0.0, 0.0, 1.0, 1.0), endpos=(0.0, 0.0), topnew=True)'})
      call add(l:list , {'word': 'Dissolve'           , 'menu': 'Dissolve(time, alpha=False, time_warp=None)'})
      call add(l:list , {'word': 'Fade'               , 'menu': 'Fade(out_time, hold_time, old_time, color="#000")'})
      call add(l:list , {'word': 'ImageDissolve'      , 'menu': 'ImageDissolve(image, time, ramplen=8, reverse=False, alpha=True, time_warp=None)'})
      call add(l:list , {'word': 'MoveTransition'     , 'menu': "MoveTransition(delay, factory=None, enter_factory=None, leave_factory=None, old=False, layers=['master'])"})
      call add(l:list , {'word': 'MultipleTransition' , 'menu': 'MultipleTransition(args)'})
      call add(l:list , {'word': 'Pause'              , 'menu': 'Pause(delay)'})
      call add(l:list , {'word': 'Pixellate'          , 'menu': 'Pixellate(time, steps)'})
      call extend(l:list, g:renpy_transition)
   "}}}
    else
      call add(l:list , {'word': 'pass'        , 'menu': ''})
      call add(l:list , {'word': 'repeat'      , 'menu': ''})
      call add(l:list , {'word': 'block:'      , 'menu': ''})
      call add(l:list , {'word': 'choice:'     , 'menu': ''})
      call add(l:list , {'word': 'parallel'    , 'menu': ''})
      call add(l:list , {'word': 'event'       , 'menu': ''})
      call add(l:list , {'word': 'on'          , 'menu': ''})
      call add(l:list , {'word': 'contains'    , 'menu': ''})
      call add(l:list , {'word': 'function'    , 'menu': ''})
      call add(l:list , {'word': 'with'        , 'menu': ''})

      call add(l:list , {'word': 'pause'       , 'menu': "一時停止し、新しい値に飛びます。t == 1.0 なら t' = 1.0、そうでなければ t' = 0.0 です。"})
      call add(l:list , {'word': 'linear'      , 'menu': "線形補間です。t' = t'"})
      call add(l:list , {'word': 'ease'        , 'menu': "最初は遅く、スピードアップし、それからスローダウンします。t' = 0.5 - math.cos(math.pi * t) / 2.0'"})
      call add(l:list , {'word': 'easein'      , 'menu': "最初は速く、スローダウンします。t' = math.cos((1.0 - t) * math.pi / 2.0'"})
      call add(l:list , {'word': 'easeout'     , 'menu': "最初は遅く、スピードアップします。t' = 1.0 - math.cos(t * math.pi / 2.0) '"})

      call add(l:list , {'word': 'pos'         , 'menu': "Type :	(position, position)|Default :	(0, 0)|それを含む領域の左上隅に対する位置です。"})
      call add(l:list , {'word': 'xpos'        , 'menu': "Type :	position|Default :	0|それを含む領域の左端に対する水平位置です。"})
      call add(l:list , {'word': 'ypos'        , 'menu': "Type :	position|Default :	0|それを含む領域の上端に対する垂直位置です。"})
      call add(l:list , {'word': 'anchor'      , 'menu': "Type :	(position, position)|Default :	(0, 0)|それを含む displayable の左上隅に対するアンカー位置です。"})
      call add(l:list , {'word': 'xanchor'     , 'menu': "Type :	position|Default :	0|それを含む displayable の左端に対する水平アンカー位置です。"})
      call add(l:list , {'word': 'yanchor'     , 'menu': "Type :	position|Default :	0|それを含む displayable の上端に対する垂直アンカー位置です。"})
      call add(l:list , {'word': 'align'       , 'menu': "Type :	(float, float)|Default :	(0.0, 0.0)|それを含む displayable の上端に対する垂直アンカー位置です。"})
      call add(l:list , {'word': 'xalign'      , 'menu': "Type :	float|Default :	0.0|xpos および xanchor をこの値に設定するのと等価です。"})
      call add(l:list , {'word': 'yalign'      , 'menu': "Type :	float|Default :	0.0|ypos および yanchor をこの値に設定するのと等価です。"})
      call add(l:list , {'word': 'xcenter'     , 'menu': "Type :	float|Default :	0.0|xpos をこのプロパティの値に、xanchor を 0.5 に設定するのと等価です。"})
      call add(l:list , {'word': 'ycenter'     , 'menu': "Type :	float|Default :	0.0|rpos をこのプロパティの値に、ranchor を 0.5 に設定するのと等価です。"})
      call add(l:list , {'word': 'rotate'      , 'menu': "Type :	float or None|Default :	None|None なら、回転は起こりません。そうでなければ、画像はこの角度だけ時計回りに回転します。displayable を回転すると、rotate_pad の設定に従ってリサイズされます。xanchor および yanchor が 0.5 でなければ、これによって位置取りが変わることがあります。"})
      call add(l:list , {'word': 'rotate_pad'  , 'menu': "Type :	boolean|Default :	True|真なら、回転された displayable の幅と高さが、元の幅と高さの斜辺と同じになるように埋め込まれます。これは、変換が内容を回転させてもサイズが変わらないことを保証します。偽なら、変換は変換された displayable を含む最小限のサイズになります。これは固定回転に向いています。"})
      call add(l:list , {'word': 'zoom'        , 'menu': "Type :	float|Default :	1.0|これは、displayable に与えられた係数倍ズームします。これは必ず 0.5 より大きくしてください。"})
      call add(l:list , {'word': 'xzoom'       , 'menu': "Type :	float|Default :	1.0|これは、displayable に与えられた係数倍水平にズームします。これは必ず 0.5 より大きくしてください。"})
      call add(l:list , {'word': 'yzoom'       , 'menu': "Type :	float|Default :	1.0|これは、displayable に与えられた係数倍垂直にズームします。これは必ず 0.5 より大きくしてください。"})
      call add(l:list , {'word': 'alpha'       , 'menu': "Type :	float|Default :	1.0|これは、displayable の透明度を制御します。"})
      call add(l:list , {'word': 'around'      , 'menu': "Type :	(position, position)|Default :	(0.0, 0.0)|None でなければ、それを含む領域の右上に対する極座標の中心を指定します。これで中心を設定すると、position モードで円運動ができます。"})
      call add(l:list , {'word': 'alignaround' , 'menu': "Type :	(float, float)|Default :	(0.0, 0.0)|None でなければ、それを含む領域の右上に対する極座標の中心を指定します。これで中心を設定すると、align モードで円運動ができます。"})
      call add(l:list , {'word': 'angle'       , 'menu':  "Type :	float|極座標における位置の角度成分を取ります。これは、極座標の中心が設定されていないときには未定義です。"})
      call add(l:list , {'word': 'radius'      , 'menu': "Type :	position|極座標における位置の半径成分を取ります。これは、極座標の中心が設定されていないときには未定義です。"})
      call add(l:list , {'word': 'crop'        , 'menu': "Type :	None or (int, int, int, int)|Default :	None|None でなければ、displayable は与えられたボックスに切り抜かれます。そのボックスは、(x, y, width, height) のタプルで指定します。"})
      call add(l:list , {'word': 'corner1'     , 'menu': "Type :	None or (int, int)|Default :	None|None でなければ、crop ボックスの左上隅を与えます。これは crop より優先されます。"})
      call add(l:list , {'word': 'corner2'     , 'menu': "Type :	None or (int, int)|Default :	None|None でなければ、crop ボックスの右下隅を与えます。これは crop より優先されます。"})
      call add(l:list , {'word': 'size'        , 'menu': "Type :	None or (int, int)|Default :	None|None でなければ、displayable を与えられたサイズに合わせます。"})
      call add(l:list , {'word': 'subpixel'    , 'menu': "Type :	boolean|Default :	False|真なら、ピクセル以下の位置調整を利用してスクリーンに描画されます。"})
      call add(l:list , {'word': 'delay'       , 'menu': "Type :	float|Default :	0.0|この変換がトランジションとして使われていれば、これはトランジションの持続時間です。"})
    endif
 "}}}
	elseif s:checkScreen()
  "{{{ screen
		"{{{ screen statement (^\s #)
    if l:line =~ '^ *\w*$'
			call add(l:list , {'word': 'add'         , 'menu': ''})
			call add(l:list , {'word': 'bar'         , 'menu': ''})
			call add(l:list , {'word': 'button'      , 'menu': ''})
			call add(l:list , {'word': 'fixed'       , 'menu': ''})
			call add(l:list , {'word': 'frame'       , 'menu': ''})
			call add(l:list , {'word': 'grid'        , 'menu': ''})
			call add(l:list , {'word': 'hbox'        , 'menu': ''})
			call add(l:list , {'word': 'imagebutton' , 'menu': ''})
			call add(l:list , {'word': 'input'       , 'menu': ''})
			call add(l:list , {'word': 'key'         , 'menu': ''})
			call add(l:list , {'word': 'label'       , 'menu': ''})
			call add(l:list , {'word': 'null'        , 'menu': ''})
			call add(l:list , {'word': 'mousearea'   , 'menu': ''})
			call add(l:list , {'word': 'side'        , 'menu': ''})
			call add(l:list , {'word': 'text'        , 'menu': ''})
			call add(l:list , {'word': 'textbutton'  , 'menu': ''})
			call add(l:list , {'word': 'timer'       , 'menu': ''})
			call add(l:list , {'word': 'transform'   , 'menu': ''})
			call add(l:list , {'word': 'vbar'        , 'menu': ''})
			call add(l:list , {'word': 'vbox'        , 'menu': ''})
			call add(l:list , {'word': 'viewport'    , 'menu': ''})
			call add(l:list , {'word': 'window'      , 'menu': ''})
			call add(l:list , {'word': 'imagemap'    , 'menu': ''})
			call add(l:list , {'word': 'hotspot'     , 'menu': ''})
			call add(l:list , {'word': 'hotbar'      , 'menu': ''})
			call add(l:list , {'word': 'has'         , 'menu': ''})
			call add(l:list , {'word': 'drag'        , 'menu': ''})
			call add(l:list , {'word': 'draggroup'   , 'menu': ''})
			call add(l:list , {'word': 'default'     , 'menu': ''})
			call add(l:list , {'word': 'for'         , 'menu': ''})
			call add(l:list , {'word': 'if'          , 'menu': ''})
			call add(l:list , {'word': 'on'          , 'menu': ''})
			call add(l:list , {'word': 'use'         , 'menu': ''})
			call add(l:list , {'word': 'python'      , 'menu': ''})
			call add(l:list , {'word': 'show screen' , 'menu': ''})
			call add(l:list , {'word': 'hide screen' , 'menu': ''})
			call add(l:list , {'word': 'call screen' , 'menu': ''})
		" }}}
		"{{{ Action
		else
			call add(l:list , {'word': 'Hide('                 , 'menu': '(screen, transition=None)'})
			call add(l:list , {'word': 'Jump('                 , 'menu': '(label)'})
			call add(l:list , {'word': 'Return('               , 'menu': '(value=None)'})
			call add(l:list , {'word': 'Show('                 , 'menu': '(screen, transition=None, *args, **kwargs)'})
			call add(l:list , {'word': 'ShowTransient('        , 'menu': '(screen, *args, **kwargs)'})
			call add(l:list , {'word': 'SetDict('              , 'menu': '(dict, key, value)'})
			call add(l:list , {'word': 'SetField('             , 'menu': '(objectfield, value')})
			call add(l:list , {'word': 'SetScreenVariable('    , 'menu': '(name, value)'})
			call add(l:list , {'word': 'SetVariable('          , 'menu': '(variable, value)'})
			call add(l:list , {'word': 'ToggleDict('           , 'menu': '(dict, key, true_value=None, false_value=None)'})
			call add(l:list , {'word': 'ToggleField('          , 'menu': '(object, field, true_value=None, false_value=None)'})
			call add(l:list , {'word': 'ToggleScreenVariable(' , 'menu': '(name, true_value=None, false_value=None)'})
			call add(l:list , {'word': 'ToggleVariable('       , 'menu': '(variable, true_value=None, false_value=None)'})
			call add(l:list , {'word': 'MainMenu('             , 'menu': '(confirm=True)'})
			call add(l:list , {'word': 'Quit('                 , 'menu': '(confirm=True)'})
			call add(l:list , {'word': 'ShowMenu('             , 'menu': '(screen=None)'})
			call add(l:list , {'word': 'Start('                , 'menu': '(label='start')'})
			call add(l:list , {'word': 'FileAction('           , 'menu': '(name, page=None)'})
			call add(l:list , {'word': 'FileDelete('           , 'menu': '(name, confirm=True, page=None)'})
			call add(l:list , {'word': 'FileLoad('             , 'menu': '(name, confirm=True, page=None, newest=True)'})
			call add(l:list , {'word': 'FilePage('             , 'menu': '(page)'})
			call add(l:list , {'word': 'FilePageNext('         , 'menu': '(max=None)'})
			call add(l:list , {'word': 'FilePagePrevious('     , 'menu': '(self)'})
			call add(l:list , {'word': 'FileSave('             , 'menu': '(name, confirm=True, newest=True, page=None, cycle=False)'})
			call add(l:list , {'word': 'FileTakeScreenshot('   , 'menu': '()'})
			call add(l:list , {'word': 'QuickLoad('            , 'menu': '()'})
			call add(l:list , {'word': 'QuickSave('            , 'menu': '(message=''Quick save complete.'', newest=False)'})
			call add(l:list , {'word': 'Play('                 , 'menu': '(channel, file, **kwargs)'})
			call add(l:list , {'word': 'Queue('                , 'menu': '(channel, file, **kwargs)'})
			call add(l:list , {'word': 'SetMixer('             , 'menu': '(mixer, volume)'})
		" }}}
		endif
	" }}}
	else
 "{{{ statement (^\s*#)
      let g:test=1
    if l:line =~ '^\s*\w*$'
      let g:state=1
      call add(l:list , {'word': 'python'       , 'menu': ''})
      call add(l:list , {'word': 'init'         , 'menu': ''})
      call add(l:list , {'word': 'label'        , 'menu': ''})
      call add(l:list , {'word': 'menu'         , 'menu': ''})
      call add(l:list , {'word': 'say'          , 'menu': ''})
      call add(l:list , {'word': 'voice'        , 'menu': ''})
      call add(l:list , {'word': 'play'         , 'menu': ''})
      call add(l:list , {'word': 'play music '  , 'menu': ''})
      call add(l:list , {'word': 'play sound '  , 'menu': ''})
      call add(l:list , {'word': 'queue'        , 'menu': ''})
      call add(l:list , {'word': 'queue music ' , 'menu': ''})
      call add(l:list , {'word': 'queue sound ' , 'menu': ''})
      call add(l:list , {'word': 'stop'         , 'menu': ''})
      call add(l:list , {'word': 'stop music '  , 'menu': ''})
      call add(l:list , {'word': 'stop sound '  , 'menu': ''})
      call add(l:list , {'word': 'with'         , 'menu': ''})
      call add(l:list , {'word': 'show'         , 'menu': ''})
      call add(l:list , {'word': 'hide'         , 'menu': ''})
      call add(l:list , {'word': 'scene'        , 'menu': ''})
      call add(l:list , {'word': 'screen'       , 'menu': ''})
      call add(l:list , {'word': 'image'        , 'menu': ''})
      call add(l:list , {'word': 'define'       , 'menu': ''})
      call add(l:list , {'word': 'return'       , 'menu': ''})
      call add(l:list , {'word': 'transform'    , 'menu': ''})
      call add(l:list , {'word': 'window'       , 'menu': ''})
      call add(l:list , {'word': 'window show'  , 'menu': ''})
      call add(l:list , {'word': 'window hide'  , 'menu': ''})
      call add(l:list , {'word': 'jump'         , 'menu': ''})
      call add(l:list , {'word': 'call'         , 'menu': ''})
      call add(l:list , {'word': 'while'        , 'menu': ''})
      call add(l:list , {'word': 'if'           , 'menu': ''})
      call add(l:list , {'word': 'else:'        , 'menu': ''})
      call add(l:list , {'word': 'nvl'          , 'menu': ''})
      call add(l:list , {'word': 'nvl clear'    , 'menu': ''})
      call add(l:list , {'word': 'extend'       , 'menu': ''})
      call add(l:list , {'word': 'center'       , 'menu': ''})
      call add(l:list , {'word': 'pause'        , 'menu': ''})
   "}}}
   "{{{ with transition (with #)
    elseif l:line =~ 'with\s\+\w*$'
      call add(l:list , {'word': 'dissolve'           , 'menu': ''})
      call add(l:list , {'word': 'fade'               , 'menu': ''})
      call add(l:list , {'word': 'move'               , 'menu': ''})
      call add(l:list , {'word': 'ease'               , 'menu': ''})
      call add(l:list , {'word': 'vpunch'             , 'menu': ''})
      call add(l:list , {'word': 'hpunch'             , 'menu': ''})
      call add(l:list , {'word': 'blinds'             , 'menu': ''})
      call add(l:list , {'word': 'squares'            , 'menu': ''})
      call add(l:list , {'word': 'pixellate'          , 'menu': ''})

      call add(l:list , {'word': 'wiperight'          , 'menu': ''})
      call add(l:list , {'word': 'wipeleft'           , 'menu': ''})
      call add(l:list , {'word': 'wipeup'             , 'menu': ''})
      call add(l:list , {'word': 'wipedown'           , 'menu': ''})

      call add(l:list , {'word': 'slideright'         , 'menu': ''})
      call add(l:list , {'word': 'slideleft'          , 'menu': ''})
      call add(l:list , {'word': 'slideup'            , 'menu': ''})
      call add(l:list , {'word': 'slidedown'          , 'menu': ''})

      call add(l:list , {'word': 'slideawayright'     , 'menu': ''})
      call add(l:list , {'word': 'slideawayleft'      , 'menu': ''})
      call add(l:list , {'word': 'slideawayup'        , 'menu': ''})
      call add(l:list , {'word': 'slideawaydown'      , 'menu': ''})

      call add(l:list , {'word': 'easeintright'       , 'menu': ''})
      call add(l:list , {'word': 'easeintleft'        , 'menu': ''})
      call add(l:list , {'word': 'easeintup'          , 'menu': ''})
      call add(l:list , {'word': 'easeintdown'        , 'menu': ''})

      call add(l:list , {'word': 'easeoutright'       , 'menu': ''})
      call add(l:list , {'word': 'easeoutleft'        , 'menu': ''})
      call add(l:list , {'word': 'easeoutup'          , 'menu': ''})
      call add(l:list , {'word': 'easeoutdown'        , 'menu': ''})


      call add(l:list , {'word': 'moveintright'       , 'menu': ''})
      call add(l:list , {'word': 'moveintleft'        , 'menu': ''})
      call add(l:list , {'word': 'moveintup'          , 'menu': ''})
      call add(l:list , {'word': 'moveintdown'        , 'menu': ''})

      call add(l:list , {'word': 'moveoutright'       , 'menu': ''})
      call add(l:list , {'word': 'moveoutleft'        , 'menu': ''})
      call add(l:list , {'word': 'moveoutup'          , 'menu': ''})
      call add(l:list , {'word': 'moveoutdown'        , 'menu': ''})

      call add(l:list , {'word': 'irisout'            , 'menu': ''})
      call add(l:list , {'word': 'irisin'             , 'menu': ''})


      call add(l:list , {'word': 'zoomout'            , 'menu': ''})
      call add(l:list , {'word': 'zoomin'             , 'menu': ''})
      call add(l:list , {'word': 'zoominout'          , 'menu': ''})

      call add(l:list , {'word': 'AlphaDissolve'      , 'menu': 'AlphaDissolve(control, delay=0.0, alpha=False, reverse=False)'})
      call add(l:list , {'word': 'ComposeTransition'  , 'menu': 'ComposeTransition(trans, before, after)'})
      call add(l:list , {'word': 'CropMove'           , 'menu': 'CropMove(time, mode="slideright", startcrop=(0.0, 0.0, 0.0, 1.0), startpos=(0.0, 0.0), endcrop=(0.0, 0.0, 1.0, 1.0), endpos=(0.0, 0.0), topnew=True)'})
      call add(l:list , {'word': 'Dissolve'           , 'menu': 'Dissolve(time, alpha=False, time_warp=None)'})
      call add(l:list , {'word': 'Fade'               , 'menu': 'Fade(out_time, hold_time, old_time, color="#000")'})
      call add(l:list , {'word': 'ImageDissolve'      , 'menu': 'ImageDissolve(image, time, ramplen=8, reverse=False, alpha=True, time_warp=None)'})
      call add(l:list , {'word': 'MoveTransition'     , 'menu': "MoveTransition(delay, factory=None, enter_factory=None, leave_factory=None, old=False, layers=['master'])"})
      call add(l:list , {'word': 'MultipleTransition' , 'menu': 'MultipleTransition(args)'})
      call add(l:list , {'word': 'Pause'              , 'menu': 'Pause(delay)'})
      call add(l:list , {'word': 'Pixellate'          , 'menu': 'Pixellate(time, steps)'})
      call extend(l:list, g:renpy_transition)
   "}}}
   "{{{ play (play #)
    elseif l:line =~ 'play.*\s\+\w*$'
      call add(l:list , {'word': 'sound'    , 'menu': ''})
      call add(l:list , {'word': 'music'    , 'menu': ''})
      call add(l:list , {'word': 'fadeout ' , 'menu': ''})
      call add(l:list , {'word': 'fadein '  , 'menu': ''})
      call add(l:list , {'word': 'loop'     , 'menu': ''})
      call add(l:list , {'word': 'noloop'   , 'menu': ''})
      call extend(l:list, g:renpy_music)
   "}}}
   "{{{ queue (queue #)
    elseif l:line =~ 'queue.*\s\+\w*$'
      call add(l:list , {'word': 'sound'  , 'menu': ''})
      call add(l:list , {'word': 'music'  , 'menu': ''})
      call add(l:list , {'word': 'loop'     , 'menu': ''})
      call add(l:list , {'word': 'noloop'   , 'menu': ''})
      call extend(l:list, g:renpy_music)
   "}}}
   "{{{ stop (stop #)
    elseif l:line =~ 'stop.*\s\+\w*$'
      call add(l:list , {'word': 'sound'  , 'menu': ''})
      call add(l:list , {'word': 'music'  , 'menu': ''})
      call add(l:list , {'word': 'fadeout ' , 'menu': ''})
      call add(l:list , {'word': 'fadein '  , 'menu': ''})
      call extend(l:list, g:renpy_music)
   "}}}
   "{{{ at transform (at #)
    elseif l:line =~ 'at\s\+\w*$'
      call add(l:list , {'word': 'center'         , 'menu': ''})
      call add(l:list , {'word': 'default'        , 'menu': ''})
      call add(l:list , {'word': 'left'           , 'menu': ''})
      call add(l:list , {'word': 'offscreenleft'  , 'menu': ''})
      call add(l:list , {'word': 'offscreenright' , 'menu': ''})
      call add(l:list , {'word': 'reset'          , 'menu': ''})
      call add(l:list , {'word': 'right'          , 'menu': ''})
      call add(l:list , {'word': 'top'            , 'menu': ''})
      call add(l:list , {'word': 'topleft'        , 'menu': ''})
      call add(l:list , {'word': 'topright'       , 'menu': ''})
      call add(l:list , {'word': 'truecenter'     , 'menu': ''})
      call extend(l:list, g:renpy_transform)
   "}}}
   "{{{ window and nvl ... + transition (window/nvl word #)
    elseif l:line =~ '\(window\|nvl\) \w*\s\+\w*$'
      call add(l:list , {'word': 'dissolve' , 'menu': ''})
    " }}}
   "{{{ scene (scene/show/hide #)
    elseif l:line =~ '\(show\|hide\|scene\)\s\+\w*$'
      call add(l:list , {'word': 'expression' , 'menu': ''})
      call add(l:list , {'word': 'black' , 'menu': ''})
      call extend(l:list, s:imagetag_list )
   "}}}
   "{{{ window (window #)
    elseif l:line =~ 'window\s\+\w*$'
      call add(l:list , {'word': 'show' , 'menu': ''})
      call add(l:list , {'word': 'hide' , 'menu': ''})
    " }}}
   "{{{ nvl (nvl #)
    elseif l:line =~ 'nvl\s\+\w*$'
      call add(l:list , {'word': 'show' , 'menu': ''})
      call add(l:list , {'word': 'hide' , 'menu': ''})
      call add(l:list , {'word': 'clear' , 'menu': ''})
    " }}}
   "{{{ im.func (im.#)
    elseif l:line =~ 'im\.\w*$'
			call add(l:list , {'word': 'im.AlphaMask('   , 'menu': '(base, mask, **properties)'})
			call add(l:list , {'word': 'im.Composite('   , 'menu': '(size, *args, **properties)'})
			call add(l:list , {'word': 'im.Crop('        , 'menu': '(im, rect)'})
			call add(l:list , {'word': 'im.FactorScale(' , 'menu': '(im, width, height=None, bilinear=True, **properties)'})
			call add(l:list , {'word': 'im.Flip('        , 'menu': '(im, horizontal=False, vertical=False, **properties)'})
			call add(l:list , {'word': 'im.Grayscale('   , 'menu': '(im, **properties)'})
			call add(l:list , {'word': 'im.Scale('       , 'menu': '(im, width, height, bilinear=True, **properties)'})
			call add(l:list , {'word': 'im.Sepia('       , 'menu': '(im, **properties)'})
			call add(l:list , {'word': 'im.Tile('        , 'menu': '(im, size=None, **properties)'})
			call add(l:list , {'word': 'im.MatrixColor('       , 'menu': '(im, matrix, **properties)'})
			call add(l:list , {'word': 'im.matrix('            , 'menu': '()'})
			call add(l:list , {'word': 'im.matrix.brightness(' , 'menu': '(b)'})
			call add(l:list , {'word': 'im.matrix.colorize('   , 'menu': '(black_color, white_color)'})
			call add(l:list , {'word': 'im.matrix.contrast('   , 'menu': '(c)'})
			call add(l:list , {'word': 'im.matrix.desaturate(' , 'menu': '()'})
			call add(l:list , {'word': 'im.matrix.hue('        , 'menu': '(h)'})
			call add(l:list , {'word': 'im.matrix.identity('   , 'menu': '()'})
			call add(l:list , {'word': 'im.matrix.invert('     , 'menu': '()'})
			call add(l:list , {'word': 'im.matrix.opacity('    , 'menu': '(o)'})
			call add(l:list , {'word': 'im.matrix.saturation(' , 'menu': '(level, desat=(0.2126, 0.7152, 0.0722))'})
			call add(l:list , {'word': 'im.matrix.tint('       , 'menu': '(r, g, b)'})
    " }}}
   "{{{ config (config.#)
    elseif l:line =~ 'config\.\w*$'
      call add(l:list , {'word': 'config.developer'               , 'menu': ''})
      call add(l:list , {'word': 'config.help'                    , 'menu': ''})
      call add(l:list , {'word': 'config.name'                    , 'menu': ''})
      call add(l:list , {'word': 'config.save_directory'          , 'menu': ''})
      call add(l:list , {'word': 'config.screen_height'           , 'menu': ''})
      call add(l:list , {'word': 'config.screen_width'            , 'menu': ''})
      call add(l:list , {'word': 'config.translations'            , 'menu': ''})
      call add(l:list , {'word': 'config.window_icon'             , 'menu': ''})
      call add(l:list , {'word': 'config.windows_icon'            , 'menu': ''})
      call add(l:list , {'word': 'config.window_title'            , 'menu': ''})
      call add(l:list , {'word': 'config.version'                 , 'menu': ''})
      call add(l:list , {'word': 'config.adv_nvl_transition'      , 'menu': ''})
      call add(l:list , {'word': 'config.after_load_transition'   , 'menu': ''})
      call add(l:list , {'word': 'config.end_game_transition'     , 'menu': ''})
      call add(l:list , {'word': 'config.end_splash_transition'   , 'menu': ''})
      call add(l:list , {'word': 'config.enter_replay_transition' , 'menu': ''})
      call add(l:list , {'word': 'config.enter_transition'        , 'menu': ''})
      call add(l:list , {'word': 'config.enter_yesno_transition'  , 'menu': ''})
      call add(l:list , {'word': 'config.exit_replay_transition'  , 'menu': ''})
      call add(l:list , {'word': 'config.exit_transition'         , 'menu': ''})
    " }}}
    " {{{ define (define #)
    elseif l:line =~ 'define'
      call add(l:list , {'word': 'Character(' , 'menu': ''})
    " }}}
   "{{{  imagename (imagetag #)
   else
    for l:imagetag in keys(g:renpy_image)
      if l:line =~ l:imagetag.'.*\s\+\w*$'
        for l:imageattribute in g:renpy_image[l:imagetag]
          call add(l:list , {'word': l:imageattribute})
        endfor
        call add(l:list , {'word': 'at'   , 'menu': ''})
        call add(l:list , {'word': 'with' , 'menu': ''})
      endif
    endfor
   endif
 "}}}
 endif
  return neocomplcache#keyword_filter(l:list, a:cur_keyword_str)
endfunction "}}}

function! neocomplcache#sources#renpy_complete#define()
  return s:source
endfunction

" for debug
" command! ATL echo s:checkATL()
" command! Screen echo s:checkScreen()
function! s:checkATL() " check in ATL {{{
  let l:match = search('\%(show\|scene\|image\|transform\).*:', 'bcnW')
  if l:match != 0
      let l:blocknest = match(getline(l:match), '\h')
      for l:line in range(l:match + 1, line('.'))
          if match(getline(l:line), '^$\|^\s*$\|^\( \)\{'.(l:blocknest + 4).'}') < 0
              return 0
          endif
      endfor
      return 1
  else
      return 0
  endif
endfunction " }}}
function! s:checkScreen() " check in Screen {{{
  let l:match = search('\%(screen\).*:', 'bcnW')
  if l:match != 0
      let l:blocknest = match(getline(l:match), '\h')
      for l:line in range(l:match + 1, line('.'))
          if match(getline(l:line), '^$\|^\s*$\|^\( \)\{'.(l:blocknest + 4).'}') < 0
              return 0
          endif
      endfor
      return 1
  else
      return 0
  endif
endfunction " }}}


" vim: ts=2 sw=2 sts=2 foldmethod=marker nowrap

