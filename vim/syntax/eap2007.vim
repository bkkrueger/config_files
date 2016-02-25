if exists("b:current_syntax")
    finish
endif

" =============================================================================
" SYNTAX GROUPS

" STATEMENTS __________________________________________________________________
syntax match eapVar "\k\+" nextgroup=eapIndex
syntax match eapIndex "(\d\+\(,\d\+\)*)\?" contained nextgroup=eapAssignment
syntax match eapAssignment "=" contained nextgroup=eapValue
syntax match eapValue ".*" contained

" VALUES ______________________________________________________________________
syntax match eapNumber "\v[+-]?\d+(\.\d*)?([Ee][+-]?\d+)?"
syntax region eapString start=_\v"_ skip=_\v\\"_ end=_\v"_
syntax match eapBool "\v\.?[Tt][Rr][Uu][Ee]\.?"
syntax match eapBool "\v\.?[Ff][Aa][Ll][Ss][Ee]\.?"

syntax match eapParserVar "\$\k\+"

" COMMENTS ____________________________________________________________________
syntax match eapHashComment "\v#.*$"
syntax match eapSlashComment "\v//.*$"
syntax match eapExclamComment "\v!.*$"
syntax region eapBlockComment start="\v/\*" skip="$" end="\*/" contains=eapBlockComment

" =============================================================================
" HIGHLIGHT GROUPS

" As can be seen by running "help highlight-args", there are three types of
" terminals: term, cterm, gui.  Some testing suggests I'm on cterm -- not a
" GUI, but colors are allowed.  GUIs have more flexibility: you can change font
" face, use RGB hex codes for colors, and so on.  Cterm has a more limited
" range of colors, based on whatever the terminal defines (typically either 8
" or 16 colors).  Plus, then my color choices have to fit with anyone else's
" terminal color scheme.  So for the time being, I'm just going to skip this.
" But if I want to use these, I just need to uncomment these lines, fill in the
" colors and other options (cterm does have some additional options, such as
" bold), and then below on the "highlight default link" lines I need to change
" to use these highlight groups instead of the standard ones.
"highlight HashComment ctermfg=
"highlight SlashComment ctermfg=
"highlight ExclamComment ctermfg=

" =============================================================================
" LINK GROUPS
highlight default link eapVar Type
highlight default link eapIndex Identifier
highlight default link eapAssignment Statement
highlight default link eapValue Constant

highlight default link eapString String
highlight default link eapBool Boolean
highlight default link eapNumber Number

highlight default link eapParserVar PreProc

highlight default link eapHashComment Comment
highlight default link eapSlashComment Comment
highlight default link eapExclamComment Comment
highlight default link eapBlockComment Comment

let b:current_syntax = "eap2007"

