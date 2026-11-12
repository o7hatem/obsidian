" Move by visual lines instead of logical lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Map 'jk' to quickly escape insert mode
inoremap jk <Esc>

" Visual mode surround maps
vmap s" :surround " "
vmap s' :surround ' '
vmap s( :surround ( )
vmap s[ :surround [ ]
vmap s{ :surround { }
vmap s* :surround * *
vmap s_ :surround _ _
vmap sb :surround ** **

" Map 'ys' to toggle bold, italics, etc. via Obsidian commands
exmap toggleBold obcommand editor:toggle-bold
nmap ysb :toggleBold
vmap ysb :toggleBold

exmap toggleItalics obcommand editor:toggle-italics
nmap ysi :toggleItalics
vmap ysi :toggleItalics

exmap toggleHighlight obcommand editor:toggle-highlight
nmap ysh :toggleHighlight
vmap ysh :toggleHighlight

