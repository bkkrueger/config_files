set ruler
syntax on
set expandtab
set shiftwidth=4
set tabstop=4
set hlsearch
set textwidth=79
set backspace=2
source ~/.vim/syntax/gnuplot.vim
filetype plugin indent on

" avoid the escape key (or Ctrl-[ which is equivalent): j and k in either
" order, capitalized or not, and you get an Escape.  This might show a weird
" blip when you type either letter because Vim is waiting to see if you really
" want a j or a k or if you are about to escape back to normal mode.  But as
" long as you can tolerate that little blip, it shouldn't interfere with
" regular typing.  Unless, of course, you really want to type something with
" one of these combinations.  An essay about Dijkstra would, ironically, be
" miserable with these mappings.  You just have to deal with being a little
" patient after the j and before the k.
inoremap jk <Esc>
inoremap jK <Esc>
inoremap Jk <Esc>
inoremap JK <Esc>
inoremap kj <Esc>
inoremap kJ <Esc>
inoremap Kj <Esc>
inoremap KJ <Esc>

" use cpp11.vim and cpp11_cbase.vim for C++11-compatible syntax highlighting
" -- delete this line and the cpp11 files in .vim/syntax to return to default
au BufNewFile,BufRead *.cpp set syntax=cpp11

" if autocommands are not yet loaded, load them
if !exists("autocommands_loaded")
   let autocommands_loaded = 1
   let fortran_do_enddo = 1
   " turn off syntax if the filetype is text (the 'text' filetype is set by
   " the command 'au BufRead,BufNewFile *.txt     set filetype=text'
   " in ~/.vim/ftdetect/text.vim)
   au Syntax text   runtime! syntax/text.vim
endif

" change color for some syntax highlighting
"highlight Statement ctermfg=Green
"highlight Type      ctermfg=Brown
"highlight Operator  ctermfg=Yellow
"highlight Search    ctermbg=Blue

" fill rest of line with characters
function! FillLine( str )
    " set tw to the desired total length
    let tw = &textwidth
    if tw==0 | let tw = 79 | endif
    " strip trailing spaces first
    .s/[[:space:]]*$//
    " calculate total number of 'str's to insert
    let reps = (tw - col("$")) / len(a:str)
    " insert them, if there's room, removing trailing spaces (though forcing
    " there to be one)
    if reps > 0
        .s/$/\=(' '.repeat(a:str, reps))/
    endif
endfunction

" Uncomment the following to have Vim jump to the last position when reopening
" a file
if has("autocmd")
   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g'\"" | endif
endif

set textwidth=79

let g:latex_to_unicode_file_types = ["julia", "python"]

