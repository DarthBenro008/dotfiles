source ~/.config/nvim/configs/sets.vim

call plug#begin('~/.vim/plugged')
" Ayu Theme - this theme is pretty dope!
Plug 'ayu-theme/ayu-vim'
" Telescope <Works only with nvim 0.5> - trying something new
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Vim Airline - Powerline tooo frekin heavy
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"NERDTree - ik i have telescope, but i still want to feel home
Plug 'preservim/nerdtree'
" Coc.Nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" TODO: Configure COC
" Comment - cause why not
Plug 'tpope/vim-commentary'
" UndoTree - for all the oopsies and dumb stuff 
Plug 'mbbill/undotree'
" Stupid Content Tracker stuff
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" I'm too lazy to write remaps
Plug 'jiangmiao/auto-pairs'
" Markdown - the best doc lang, no LaTeX
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
call plug#end()

" Set Color Theme
let ayucolor="mirage"
colorscheme ayu

let mapleader=" " 

source ~/.config/nvim/configs/lets.vim
source ~/.config/nvim/configs/telescope.vim
source ~/.config/nvim/configs/maps.vim
source ~/.config/nvim/configs/coc.vim
source ~/.config/nvim/configs/go.vim
source ~/.config/nvim/configs/md.vim
