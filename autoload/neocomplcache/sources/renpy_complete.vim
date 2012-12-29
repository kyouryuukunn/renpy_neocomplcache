" plugin for neocomplcache <http://github.com/Shougo/neocomplcache>
"

let s:source = {
      \ 'name' : 'renpy_complete',
      \ 'kind' : 'ftplugin',
      \ 'filetypes': { 'renpy': 1 },
      \ }

function! s:source.initialize()
  if !exists('g:renpy_transform')
          let g:renpy_transform = []
  endif
  if !exists('g:renpy_transiton')
          let g:renpy_transition = []
  endif
  if !exists('g:renpy_image')
          "let g:renpy_image = {}
          let g:renpy_image = {'imagetag': ['imageattribute']}
  endif
  let s:imagetag_list = []
  for l:imagetag in keys(g:renpy_image)
    call add(s:imagetag_list , {'word': l:imagetag})
  endfor
endfunction

function! s:source.finalize()
endfunction

function! s:source.get_keyword_pos(cur_text) "{{{
  if neocomplcache#within_comment()
    return -1
  endif
  if s:checkATL()
		return matchend(a:cur_text, '.*\w*\s$')
  elseif match(a:cur_text, '"') < 0
    if search('.*\w*\s\%#', 'bcn', neocomplcache#get_cur_text() )
      return matchend(a:cur_text, '.*\w*\s$')
    elseif a:cur_text =~ '^\s*$'
      return matchend(a:cur_text, '^\s*$')
    else
      return matchend(a:cur_text, '^\h') - 1
    endif
  endif
endfunction "}}}

function! s:source.get_complete_words(cur_keyword_pos, cur_keyword_str) "{{{
  let l:list = []
  let l:line = neocomplcache#get_cur_text()
  if s:checkATL()
 "{{{ ATL
   "{{{ with transition
    if search('with\s\%#', 'bcn', l:line)
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
      call add(l:list , {'word': 'pass'    , 'menu': ''})
      call add(l:list , {'word': 'repeat'    , 'menu': ''})
      call add(l:list , {'word': 'block:'    , 'menu': ''})
      call add(l:list , {'word': 'choice:'    , 'menu': ''})
      call add(l:list , {'word': 'parallel'    , 'menu': ''})
      call add(l:list , {'word': 'event'    , 'menu': ''})
      call add(l:list , {'word': 'on'    , 'menu': ''})
      call add(l:list , {'word': 'contains'    , 'menu': ''})
      call add(l:list , {'word': 'function'    , 'menu': ''})
      call add(l:list , {'word': 'with'    , 'menu': ''})

      call add(l:list ,  {'word': 'pause', 'menu': "�ꎞ��~���A�V�����l�ɔ�т܂��Bt == 1.0 �Ȃ� t' = 1.0�A�����łȂ���� t' = 0.0 �ł��B"})
      call add(l:list ,  {'word': 'linear', 'menu': "���`��Ԃł��Bt' = t'"})
      call add(l:list ,  {'word': 'ease', 'menu': "�ŏ��͒x���A�X�s�[�h�A�b�v���A���ꂩ��X���[�_�E�����܂��Bt' = 0.5 - math.cos(math.pi * t) / 2.0'"})
      call add(l:list ,  {'word': 'easein', 'menu': "�ŏ��͑����A�X���[�_�E�����܂��Bt' = math.cos((1.0 - t) * math.pi / 2.0'"})
      call add(l:list ,  {'word': 'easeout', 'menu': "�ŏ��͒x���A�X�s�[�h�A�b�v���܂��Bt' = 1.0 - math.cos(t * math.pi / 2.0) '"})

      call add(l:list ,  {'word': 'pos',  'menu': "Type :	(position, position)|Default :	(0, 0)|������܂ޗ̈�̍�����ɑ΂���ʒu�ł��B"})
      call add(l:list ,  {'word': 'xpos',  'menu': "Type :	position|Default :	0|������܂ޗ̈�̍��[�ɑ΂��鐅���ʒu�ł��B"})
      call add(l:list ,  {'word': 'ypos',  'menu': "Type :	position|Default :	0|������܂ޗ̈�̏�[�ɑ΂��鐂���ʒu�ł��B"})
      call add(l:list ,  {'word': 'anchor',  'menu': "Type :	(position, position)|Default :	(0, 0)|������܂� displayable �̍�����ɑ΂���A���J�[�ʒu�ł��B"})
      call add(l:list ,  {'word': 'xanchor',  'menu': "Type :	position|Default :	0|������܂� displayable �̍��[�ɑ΂��鐅���A���J�[�ʒu�ł��B"})
      call add(l:list ,  {'word': 'yanchor',  'menu': "Type :	position|Default :	0|������܂� displayable �̏�[�ɑ΂��鐂���A���J�[�ʒu�ł��B"})
      call add(l:list ,  {'word': 'align',  'menu': "Type :	(float, float)|Default :	(0.0, 0.0)|������܂� displayable �̏�[�ɑ΂��鐂���A���J�[�ʒu�ł��B"})
      call add(l:list ,  {'word': 'xalign',  'menu': "Type :	float|Default :	0.0|xpos ����� xanchor �����̒l�ɐݒ肷��̂Ɠ����ł��B"})
      call add(l:list ,  {'word': 'yalign',  'menu': "Type :	float|Default :	0.0|ypos ����� yanchor �����̒l�ɐݒ肷��̂Ɠ����ł��B"})
      call add(l:list ,  {'word': 'xcenter',  'menu': "Type :	float|Default :	0.0|xpos �����̃v���p�e�B�̒l�ɁAxanchor �� 0.5 �ɐݒ肷��̂Ɠ����ł��B"})
      call add(l:list ,  {'word': 'ycenter',  'menu': "Type :	float|Default :	0.0|rpos �����̃v���p�e�B�̒l�ɁAranchor �� 0.5 �ɐݒ肷��̂Ɠ����ł��B"})
      call add(l:list ,  {'word': 'rotate',  'menu': "Type :	float or None|Default :	None|None �Ȃ�A��]�͋N����܂���B�����łȂ���΁A�摜�͂��̊p�x�������v���ɉ�]���܂��Bdisplayable ����]����ƁArotate_pad �̐ݒ�ɏ]���ă��T�C�Y����܂��Bxanchor ����� yanchor �� 0.5 �łȂ���΁A����ɂ���Ĉʒu��肪�ς�邱�Ƃ�����܂��B"})
      call add(l:list ,  {'word': 'rotate_pad',  'menu': "Type :	boolean|Default :	True|�^�Ȃ�A��]���ꂽ displayable �̕��ƍ������A���̕��ƍ����̎ΕӂƓ����ɂȂ�悤�ɖ��ߍ��܂�܂��B����́A�ϊ������e����]�����Ă��T�C�Y���ς��Ȃ����Ƃ�ۏ؂��܂��B�U�Ȃ�A�ϊ��͕ϊ����ꂽ displayable ���܂ލŏ����̃T�C�Y�ɂȂ�܂��B����͌Œ��]�Ɍ����Ă��܂��B"})
      call add(l:list ,  {'word': 'zoom',  'menu': "Type :	float|Default :	1.0|����́Adisplayable �ɗ^����ꂽ�W���{�Y�[�����܂��B����͕K�� 0.5 ���傫�����Ă��������B"})
      call add(l:list ,  {'word': 'xzoom',  'menu': "Type :	float|Default :	1.0|����́Adisplayable �ɗ^����ꂽ�W���{�����ɃY�[�����܂��B����͕K�� 0.5 ���傫�����Ă��������B"})
      call add(l:list ,  {'word': 'yzoom',  'menu': "Type :	float|Default :	1.0|����́Adisplayable �ɗ^����ꂽ�W���{�����ɃY�[�����܂��B����͕K�� 0.5 ���傫�����Ă��������B"})
      call add(l:list ,  {'word': 'alpha',  'menu': "Type :	float|Default :	1.0|����́Adisplayable �̓����x�𐧌䂵�܂��B"})
      call add(l:list ,  {'word': 'around',  'menu': "Type :	(position, position)|Default :	(0.0, 0.0)|None �łȂ���΁A������܂ޗ̈�̉E��ɑ΂���ɍ��W�̒��S���w�肵�܂��B����Œ��S��ݒ肷��ƁAposition ���[�h�ŉ~�^�����ł��܂��B"})
      call add(l:list ,  {'word': 'alignaround',  'menu': "Type :	(float, float)|Default :	(0.0, 0.0)|None �łȂ���΁A������܂ޗ̈�̉E��ɑ΂���ɍ��W�̒��S���w�肵�܂��B����Œ��S��ݒ肷��ƁAalign ���[�h�ŉ~�^�����ł��܂��B"})
      call add(l:list ,  {'word': 'angle', 'menu':  "Type :	float|�ɍ��W�ɂ�����ʒu�̊p�x���������܂��B����́A�ɍ��W�̒��S���ݒ肳��Ă��Ȃ��Ƃ��ɂ͖���`�ł��B"})
      call add(l:list , {'word': 'radius', 'menu': "Type :	position|�ɍ��W�ɂ�����ʒu�̔��a���������܂��B����́A�ɍ��W�̒��S���ݒ肳��Ă��Ȃ��Ƃ��ɂ͖���`�ł��B"})
      call add(l:list , {'word': 'crop', 'menu': "Type :	None or (int, int, int, int)|Default :	None|None �łȂ���΁Adisplayable �͗^����ꂽ�{�b�N�X�ɐ؂蔲����܂��B���̃{�b�N�X�́A(x, y, width, height) �̃^�v���Ŏw�肵�܂��B"})
      call add(l:list , {'word': 'corner1', 'menu': "Type :	None or (int, int)|Default :	None|None �łȂ���΁Acrop �{�b�N�X�̍������^���܂��B����� crop ���D�悳��܂��B"})
      call add(l:list , {'word': 'corner2', 'menu': "Type :	None or (int, int)|Default :	None|None �łȂ���΁Acrop �{�b�N�X�̉E������^���܂��B����� crop ���D�悳��܂��B"})
      call add(l:list , {'word': 'size', 'menu': "Type :	None or (int, int)|Default :	None|None �łȂ���΁Adisplayable ��^����ꂽ�T�C�Y�ɍ��킹�܂��B"})
      call add(l:list , {'word': 'subpixel', 'menu': "Type :	boolean|Default :	False|�^�Ȃ�A�s�N�Z���ȉ��̈ʒu�����𗘗p���ăX�N���[���ɕ`�悳��܂��B"})
      call add(l:list , {'word': 'delay', 'menu': "Type :	float|Default :	0.0|���̕ϊ����g�����W�V�����Ƃ��Ďg���Ă���΁A����̓g�����W�V�����̎������Ԃł��B"})
    endif
 "}}}
  else
 "{{{ statement
    if l:line =~ '^\s*$\|^\h'
      let g:test=1
      call add(l:list , {'word': 'python'    , 'menu': ''})
      call add(l:list , {'word': 'init'      , 'menu': ''})
      call add(l:list , {'word': 'label '     , 'menu': ''})
      call add(l:list , {'word': 'menu'      , 'menu': ''})
      call add(l:list , {'word': 'say'       , 'menu': ''})
      call add(l:list , {'word': 'play'      , 'menu': ''})
      call add(l:list , {'word': 'queue'      , 'menu': ''})
      call add(l:list , {'word': 'stop'      , 'menu': ''})
      call add(l:list , {'word': 'with'      , 'menu': ''})
      call add(l:list , {'word': 'show'      , 'menu': ''})
      call add(l:list , {'word': 'hide'      , 'menu': ''})
      call add(l:list , {'word': 'scene'     , 'menu': ''})
      call add(l:list , {'word': 'screen'    , 'menu': ''})
      call add(l:list , {'word': 'image'     , 'menu': ''})
      call add(l:list , {'word': 'define'    , 'menu': ''})
      call add(l:list , {'word': 'return'    , 'menu': ''})
      call add(l:list , {'word': 'transform ' , 'menu': ''})
      call add(l:list , {'word': 'window'    , 'menu': ''})
      call add(l:list , {'word': 'jump'      , 'menu': ''})
      call add(l:list , {'word': 'call'      , 'menu': ''})
      call add(l:list , {'word': 'while'      , 'menu': ''})
      call add(l:list , {'word': 'if'      , 'menu': ''})
      call add(l:list , {'word': 'else:'      , 'menu': ''})
      call add(l:list , {'word': 'nvl'      , 'menu': ''})
      call add(l:list , {'word': 'extend'      , 'menu': ''})
      call add(l:list , {'word': 'center'      , 'menu': ''})
      call add(l:list , {'word': 'pause'      , 'menu': ''})
   "}}}
   "{{{ with transition
    elseif search('with\s\%#', 'bcn', l:line)
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
   "{{{ play
    elseif search('play\s\%#', 'bcn', l:line)
      call add(l:list , {'word': 'soudn' , 'menu': ''})
      call add(l:list , {'word': 'music'  , 'menu': ''})
      call add(l:list , {'word': 'voice'  , 'menu': ''})
   "}}}
   "{{{ queue
    elseif search('queue\s\%#', 'bcn', l:line)
      call add(l:list , {'word': 'soudn' , 'menu': ''})
      call add(l:list , {'word': 'music'  , 'menu': ''})
      call add(l:list , {'word': 'voice'  , 'menu': ''})
   "}}}
   "{{{ stop
    elseif search('stop\s\%#', 'bcn', l:line)
      call add(l:list , {'word': 'soudn' , 'menu': ''})
      call add(l:list , {'word': 'music'  , 'menu': ''})
      call add(l:list , {'word': 'voice'  , 'menu': ''})
   "}}}
   "{{{ at transform
    elseif search('at\s\%#', 'bcn', l:line)
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
   "{{{ scene
    elseif search('scene\s\%#', 'bcn', l:line)
      call add(l:list , {'word': 'expression' , 'menu': ''})
      call add(l:list , {'word': 'black' , 'menu': ''})
      call extend(l:list, s:imagetag_list )
   "}}}
   "{{{ show
    elseif search('show\s\%#', 'bcn', l:line)
      call add(l:list , {'word': 'expression' , 'menu': ''})
      call extend(l:list, s:imagetag_list )
   "}}}
   "{{{ hide
    elseif search('hide\s\%#', 'bcn', l:line)
      call extend(l:list, s:imagetag_list )
    " }}}
   "{{{ window
    elseif search('window\s\%#', 'bcn', l:line)
      call add(l:list , {'word': 'show' , 'menu': ''})
      call add(l:list , {'word': 'hide' , 'menu': ''})
    " }}}
   "{{{ nvl
    elseif search('nvl\s\%#', 'bcn', l:line)
      call add(l:list , {'word': 'show' , 'menu': ''})
      call add(l:list , {'word': 'hide' , 'menu': ''})
      call add(l:list , {'word': 'clear' , 'menu': ''})
    " }}}
   "{{{ window and nvl ... + transition
    elseif search('\(window\|nvl\)\s\w*\s\%#', 'bcn', l:line)
      call add(l:list , {'word': 'dissolve' , 'menu': ''})
    " }}}
   "{{{  imagename
   else
    for l:imagetag in keys(g:renpy_image)
      if search(l:imagetag.'.*\s\%#', 'bcn', l:line)
        for l:imageattribute in g:renpy_image[l:imagetag]
          call add(l:list , {'word': l:imageattribute})
        endfor
        call add(l:list , {'word': 'at' , 'menu': ''})
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


command! ATL call s:checkATL()
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


" vim: ts=2 sw=2 sts=2 foldmethod=marker nowrap

