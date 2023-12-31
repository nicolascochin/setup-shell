" set leader key
"let g:mapleader = "\<Space>"
let mapleader = ","

if &compatible
  set nocompatible
endif

syntax enable              " Enables syntax highlighing
set hidden                 " Required to keep multiple buffers open multiple buffers
set nowrap                 " Display long lines as just one line
set encoding=utf-8         " The encoding displayed
set fileencoding=utf-8     " The encoding written to file
set cursorline             " Enable highlighting of the current line
set ruler              	   " Show the cursor position all the time
set number                 " Line numbers
set iskeyword+=-           " treat dash separated words as a word text object"
set mouse=a                " Enable your mouse
set splitbelow             " Horizontal splits will automatically be below
set splitright             " Vertical splits will automatically be to the right
"set background=dark
set t_Co=256               " Support 256 colors
set conceallevel=0         " So that I can see `` in markdown files
set tabstop=2              " Insert 2 spaces for a tab
set shiftwidth=2           " Change the number of space characters inserted for indentation
set smarttab               " Makes tabbing smarter will realize you have 2 vs 4
set expandtab              " Converts tabs to spaces
set smartindent            " Makes indenting smart
set autoindent             " Good auto indent
set autoread               " Auto reload the file
set laststatus=2           " Always display the status line
"set background=dark        " tell vim what the background color looks like
set showtabline=2          " Always show tabs
set noshowmode             " Useless to show the mode since airline shows it
set nobackup               " This is recommended by coc
set nowritebackup          " This is recommended by coc
set updatetime=300         " Faster completion
set timeoutlen=500         " By default timeoutlen is 1000 ms
set formatoptions-=cro     " Stop newline continution of comments
set clipboard+=unnamedplus  " Copy paste between vim and everything else


au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
autocmd BufWritePre * :%s/\s\+$//e      " auto trim ALL files on save

if has("termguicolors")
  set termguicolors
endif



