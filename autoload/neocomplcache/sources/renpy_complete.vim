
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
  if search('[^"]*\w*\s\%#', 'bcn', neocomplcache#get_cur_text() )
		return matchend(a:cur_text, '.*\w*\s$')
  else
		return matchend(a:cur_text, '^\s*$')
	endif
endfunction "}}}

function! s:source.get_complete_words(cur_keyword_pos, cur_keyword_str) "{{{
  let l:list = []
  let l:line = neocomplcache#get_cur_text()
 "{{{ statement
  if l:line =~ '^\s*$'
    call add(l:list , {'word': 'python'    , 'menu': ''})
    call add(l:list , {'word': 'init'      , 'menu': ''})
    call add(l:list , {'word': 'label'     , 'menu': ''})
    call add(l:list , {'word': 'menu'      , 'menu': ''})
    call add(l:list , {'word': 'say'       , 'menu': ''})
    call add(l:list , {'word': 'play'      , 'menu': ''})
    call add(l:list , {'word': 'with'      , 'menu': ''})
    call add(l:list , {'word': 'show'      , 'menu': ''})
    call add(l:list , {'word': 'hide'      , 'menu': ''})
    call add(l:list , {'word': 'scene'     , 'menu': ''})
    call add(l:list , {'word': 'image'     , 'menu': ''})
    call add(l:list , {'word': 'define'    , 'menu': ''})
    call add(l:list , {'word': 'return'    , 'menu': ''})
    call add(l:list , {'word': 'transform' , 'menu': ''})
 "}}}
 "{{{ with transition
  elseif search('with\s\%#', 'bcn', l:line)
    call add(l:list , {'word': 'dissolve' , 'menu': ''})
    call add(l:list , {'word': 'fade'     , 'menu': ''})
    call add(l:list , {'word': 'move'     , 'menu': ''})
    call extend(l:list, g:renpy_transition)
 "}}}
 "{{{ play
  elseif search('play\s\%#', 'bcn', l:line)
    call add(l:list , {'word': 'soudn' , 'menu': ''})
    call add(l:list , {'word': 'music'  , 'menu': ''})
    call add(l:list , {'word': 'voice'  , 'menu': ''})
 "}}}
 "{{{ at transform
  elseif search('at\s\%#', 'bcn', l:line)
    call add(l:list , {'word': 'right' , 'menu': ''})
    call add(l:list , {'word': 'center'  , 'menu': ''})
    call add(l:list , {'word': 'left'  , 'menu': ''})
    call extend(l:list, g:renpy_transform)
 "}}}
 "{{{ scene
  elseif search('scene\s\%#', 'bcn', l:line)
    call add(l:list , {'word': 'expression' , 'menu': ''})
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
  return neocomplcache#keyword_filter(l:list, a:cur_keyword_str)
endfunction "}}}

function! neocomplcache#sources#renpy_complete#define()
  return s:source
endfunction




" vim: ts=2 sw=2 sts=2 foldmethod=marker nowrap

