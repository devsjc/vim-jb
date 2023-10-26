" === Color Variables ================================================================

let s:colors = {
    \ "editor_bg": {"gui": "#1c1c1c", "cterm": "16"},
    \ "editor_bg1": {"gui": "#1f1f1f", "cterm": "16"},
    \ "tree_bg": {"gui": "#2B2D30", "cterm": "235"},
    \ "comment_grey": {"gui": "#7A7E85", "cterm": "102"},
    \ "commentref_grey": {"gui": "#A1A1A1", "cterm": "102"},
    \ "gutter_fg_grey" : {"gui": "#474b57", "cterm": "102"},
    \ "folded_fg_white": {"gui": "#868991", "cterm": "102"},
    \ "folded_bg_grey": {"gui": "#393B40", "cterm": "102"},
    \ "normal_white": {"gui": "#BCBEC4", "cterm": "146"},
    \ "diff_deletedline_bg_grey": {"gui": "#484A4A", "cterm": "59"},
    \ "gutterdel_grey": {"gui": "#868A91", "cterm": "102"},
    \ "keyword_orange": {"gui": "#CF8E6D", "cterm": "173"},  
    \ "type_orange":{"gui": "#CC7832", "cterm": "173"},
    \ "function_blue": {"gui": "#56A8F5", "cterm": "75"},
    \ "link_blue": {"gui": "#548AF7", "cterm": "75"},
    \ "cursor_blue": {"gui": "#3c64c0", "cterm": "61"},
    \ "number_blue": {"gui": "#2AACB8", "cterm": "75"},
    \ "localstruct_blue": {"gui": "#6FAFBD", "cterm": "39"},
    \ "diff_changedline_bg_blue": {"gui": "#283541", "cterm": "23"},
    \ "diff_changedtext_bg_blue": {"gui": "#385570", "cterm": "59"},
    \ "gutterchange_blue": {"gui": "#375FAD", "cterm": "61"},
    \ "tag_yellow": {"gui": "#D5B778", "cterm": "143"},
    \ "warning_yellow": {"gui": "#F2C55C", "cterm": "221"},
    \ "functioncall_yellow": {"gui": "#B09D79", "cterm": "143"},
    \ "string_green": {"gui": "#6AAB73", "cterm": "72"},
    \ "commenttag_green": {"gui": "#67A37C", "cterm": "72"},
    \ "search_green": {"gui": "#2D543F", "cterm": "23"},
    \ "diff_addedline_bg_green": {"gui": "#294436", "cterm": "23"},
    \ "gutteradd_green": {"gui": "#549159", "cterm": "65"},
    \ "package_yellow": {"gui": "#AFBF7E", "cterm": "144"},
    \ "todo_green": {"gui": "#8bb33d", "cterm": "107"},
    \ "const_purple": {"gui": "#c77dbb", "cterm": "175"},
    \ "errsign_red": { "gui": "#cf514e", "cterm": "167"},
    \ "err_red": { "gui": "#F75464", "cterm": "167"},
    \ }

function! jb#GetColors()
    return s:colors
endfunction

