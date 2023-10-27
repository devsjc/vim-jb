" ===================================================================================
" URL:      https://github.com/devsjc/vim-jb
" Filename: autoload/jb.vim
" Author:   devsjc
" License:  The MIT License (MIT)
" Based On: https://github.com/sainnhe/sonokai
" ===================================================================================

let s:flines = readfile('autoload/palettes.json')
let s:jb_palettes = js_decode(join(s:flines))
echom: s:jb_palettes
let s:colors = {}

function! jb#GetConfig()
  let s:path = expand('<sfile>:p') " the path of this script
        \ 'style': get(g:, 'jb_style', 'dark'),
        \ 'overrides': get(g:, 'jb_color_overrides', {}),
        \ 'enable_italic': get(g:, 'jb_enable_italic', 0)
        \ }
endfunction

function! jb#GetColors(style, overrides)
   " If style is anything other than 'dark', 'mid', light', set it's value to 'dark'
    let l:style = a:style ==# 'mid' ? 'mid' : a:style ==# 'light' ? 'light' : 'dark'
    " Load the palette according to the style
    let l:palettes_dict = get(s:jb_palettes, 'dark', {})
    " Populate the colors dictionary
    for [key, val] in items(l:palettes_dict)
        let s:colors[key] = get(a:overrides, key, {"gui": val.hex, "cterm": val.xterm})
    endfor

    return s:colors
endfunction

