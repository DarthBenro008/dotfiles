" Plugin Manager
call plug#begin("~/.vim/plugged")
  " Theme
  Plug 'dracula/vim'
  Plug 'arcticicestudio/nord-vim'
  " Status Bar
  " Plug 'itchyny/lightline.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Surround
  Plug 'tpope/vim-surround'
  Plug 'jiangmiao/auto-pairs'

  " NERDTRee
  Plug 'scrooloose/nerdtree'

  "NERDCommenter
  Plug 'scrooloose/nerdcommenter'

  "Git
  Plug 'tpope/vim-fugitive'

  "Icons
  Plug 'ryanoasis/vim-devicons'

  "LSP
  Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}


call plug#end()

if (has("termguicolors"))
 set termguicolors
endif

set guifont=JetBrainsMono\ Nerd\ Font\ 11
" Setting Theme
syntax enable
colorscheme dracula


" Status Line Configs
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'component_function': {
      \   'gitbranch': '%{FugitiveStatusline()}' 
      \ },
      \ }
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'

" NERDCommenter
filetype plugin on

" COC Global Extensions
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-go','coc-markdownlint','coc-yaml', 'coc-dot-complete']

" COC Nvim 
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


