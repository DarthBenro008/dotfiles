" Window Navigation
nnoremap <leader>h <C-w>h <CR>
nnoremap <leader>j <C-w>j <CR>
nnoremap <leader>k <C-w>k <CR>
nnoremap <leader>l <C-w>l <CR>
nnoremap <leader>q <C-w>q <CR>
nnoremap <leader><BAR> <C-w>v <CR>
" Buffer Navigation
nnoremap <leader><TAB> :bn <CR>
nnoremap qq :bd <CR>

" NERDTree Remaps - this is legacy, switched to telescope
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>b :NERDTreeToggle<CR>

" Comment
noremap <C-_> :Commentary<CR>

" UndoTree Remaps
nnoremap <leader>uu :UndotreeToggle<CR>

" Cpp Remaps
nnoremap <C-c> :!g++ -o  %:r.out % -std=c++11<Enter>
nnoremap <C-x> :!./%:r.out