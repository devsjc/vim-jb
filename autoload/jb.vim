" ===================================================================================
" URL:      https://github.com/devsjc/vim-jb
" Filename: autoload/jb.vim
" Author:   devsjc
" License:  The MIT License (MIT)
" Based On: https://github.com/sainnhe/sonokai
" ===================================================================================

let s:path = printf('%s/palettes.json', expand('<sfile>:p:h'))
let s:flines = readfile(s:path)
let s:jb_palettes = json_decode(join(s:flines))
let s:colors = {}

function! jb#GetConfig()
  return {
        \ 'style': get(g:, 'jb_style', 'dark'),
        \ 'overrides': get(g:, 'jb_color_overrides', {}),
        \ 'enable_italic': get(g:, 'jb_enable_italic', 0)
        \ }
endfunction

function! jb#GetColors(style, overrides)
   " If style is anything other than 'dark', 'mid', light', set it's value to 'dark'
    let l:style = a:style ==# 'mid' ? 'mid' : a:style ==# 'light' ? 'light' : 'dark'
    " Load the palette according to the style
    let l:palettes_dict = get(s:jb_palettes, l:style, {})
    " Populate the colors dictionary
    for [key, val] in items(l:palettes_dict)
        let s:colors[key] = get(a:overrides, key, {"gui": val.hex, "cterm": val.xterm})
    endfor

    return s:colors
endfunction

