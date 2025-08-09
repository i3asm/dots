set runtimepath+=~/.config/nvim/bundles
set packpath+=~/.vim


" don't bother with vi compatibility
set nocompatible

syntax enable
colors deus

" configure Vundle
filetype off " without this vim emits a zero exit status, later, because of :ft off

" ensure ftdetect et al work by including this after the Vundle stuff
filetype plugin indent on
filetype indent plugin on
" My sttuff
set smartindent
set cursorline
set autoindent

set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed										 " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set noexpandtab                                              " no expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:\|\ ,nbsp:·,trail:·
set nu rnu                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=4                                              " show context above/below cursorline
set shiftwidth=4                                             " normal mode indentation commands use 4 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=4                                            " insert mode tab and backspace use 4 spaces
set tabstop=4                                                " actual tabs occupy 4 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
	set ttymouse=xterm2
endif

" keyboard shortcuts
let mapleader = ','
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <leader>l          : Align
" nnoremap <leader>a         : Ag<space>
nnoremap <leader>b         : CtrlPBuffer<CR>
nnoremap <leader>d         : NERDTreeToggle<CR>
nnoremap <leader>f         : NERDTreeFind<CR>
nnoremap <leader>t         : CtrlP<CR>
nnoremap <leader>T         : CtrlPClearCache<CR> : CtrlP<CR>
nnoremap <leader>]         : TagbarToggle<CR>
" nnoremap <leader><space>   : call whitespace#strip_trailing()<CR>
nnoremap <leader>g         : GitGutterToggle<CR>
noremap <silent> <leader>v : source ~/.vimrc<CR> : filetype detect<CR>:exe":echo 'vimrc reloaded'"<CR>
noremap <F3>               : Autoformat<CR>
nnoremap S                 : %s//g<Left><Left>
noremap  <leader>,         : noh<CR>

inoremap <m-space> <Esc>/<++><Enter>"_c4l

autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE

" in case you forgot to sudo
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
" cnoremap w!! %!sudo tee > /dev/null %

" plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 0

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
	" Use Ag over Grep
	set grepprg=ag\ --nogroup\ --nocolor

	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

autocmd BufRead,BufNewFile *.blade.* set filetype=blade
autocmd BufRead,BufNewFile *.html    set filetype=html
autocmd BufRead,BufNewFile *.srt     set filetype=srt
autocmd BufRead,BufNewFile *.fdoc    set filetype=yaml
autocmd BufRead,BufNewFile *.md      set filetype=markdown
autocmd BufRead,BufNewFile *.md      set spell
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Fix Cursor in TMUX
if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
	let &t_SI = "\<Esc>]50;CursorShape=0\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Don't copy the contents of an overwritten selection.
vnoremap p "_dP

hi Normal ctermbg=none


call plug#begin()
" install Vundle bundles
if filereadable(expand("~/.config/nvim/bundles"))
	source ~/.config/nvim/vimrc.bundles
endif

Plug 'VundleVim/Vundle.vim'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'austintaylor/vim-indentobject'
Plug 'christoomey/vim-tmux-navigator'
Plug 'juvenn/mustache.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'majutsushi/tagbar'
Plug 'rking/ag.vim'
Plug 'garbas/vim-snipmate'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'nono/vim-handlebars'
Plug 'pangloss/vim-javascript'
Plug 'wookiehangover/jshint.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-pastie'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vividchalk'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/Align'
Plug 'vim-scripts/greplace.vim'
Plug 'vim-scripts/matchit.zip'

Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'OmniSharp/omnisharp-vim'
Plug 'mhartington/oceanic-next'
Plug 'baskerville/vim-sxhkdrc'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'vim-python/python-syntax'
Plug 'Chiel92/vim-autoformat'
Plug 'jwalton512/vim-blade'
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'
Plug 'wakatime/vim-wakatime'
Plug 'gisphm/vim-gitignore'
Plug 'ajmwagar/vim-deus'
call plug#end()

