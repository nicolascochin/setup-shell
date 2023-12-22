" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
"let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']

" Empty value to disable preview window altogether
"let g:fzf_preview_window = []

" run FZF with Ctl p
nnoremap  <C-p> :GFiles<CR>
nnoremap  <C-M-p> :Files<CR>
nnoremap <silent><leader>l :Buffers<CR>
"nnoremap <C-p> :<C-u>FZF<CR>
