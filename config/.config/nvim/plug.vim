" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin()

Plug 'dracula/vim', { 'as': 'dracula' }                   " Theme
Plug 'tpope/vim-sensible'                                 " vim defaults
Plug 'tpope/vim-surround'                                 " Swap surrounding such as quotes/tags...
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rails'                                    " Rails plugin
Plug 'airblade/vim-gitgutter'                             " Show git changes
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }       " FZF integration
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'                              " Bottom line

 Plug 'tpope/vim-fugitive'                                 " Git inside vim
 Plug 'preservim/nerdtree'
 Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

 Plug 'github/copilot.vim'


 Plug 'rhysd/devdocs.vim'

 Plug 'ryanoasis/vim-devicons'  " always the last one
" Initialize plugin system
call plug#end()
