" set up pathogen, https://github.com/tpope/vim-pathogen
filetype on 
filetype off
call pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on

set nocompatible

" Write the old file out when switching between files.
set autowrite
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
" Display current cursor position in lower right corner.
set ruler
set scrolloff=3                                              " show context above/below cursorline
" Ever notice a slight lag after typing the leader key + command? This lowers
set timeoutlen=500
" Switch between buffers without saving
set hidden
" Set the color scheme. Change this to your preference.
" Here's 100 to choose from:
" http://www.vim.org/scripts/script.php?script_id=625
colorscheme molokai
" Set font type and size. Depends on the resolution. Larger screens, prefer h20
set guifont=Menlo:h13
" Tab stuff
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc,*.so,*.swp,*.zip
set wildmenu                                                 " show a navigable menu for tab completion
" Show command in bottom right portion of the screen
set showcmd
" Show lines numbers
" set number
" Prefer relative line numbering?
" set relativenumber
" Indent stuff
set smartindent
set autoindent
" Always show the status line
set laststatus=2
" Prefer a slightly higher line height
" set linespace=3
" Better line wrapping
set wrap
set textwidth=79
set formatoptions=qrn1
" Set incremental searching
set incsearch
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
" Highlight searching
set hlsearch
" case insensitive search
set ignorecase
set smartcase
" Hide MacVim toolbar by default
set go-=T
" Enable code folding
set foldenable
" Hide mouse when typing
set mousehide
" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif
" Split windows below the current window.
set splitbelow
"  session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help
"  More useful command-line completion
set wildmenu
" Auto-completion menu
set wildmode=longest,list,full
" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone

" Want a different map leader than 
let mapleader = ","
map <leader>l :Align
nmap <leader>a :Ack 
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>t :CtrlP<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nmap <leader>] :TagbarToggle<CR>
nmap <leader><space> :call whitespace#strip_trailing()<CR>
nmap <leader>g :GitGutterToggle<CR>
nmap <leader>c <Plug>Kwbd
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
" Faster shortcut for commenting. Requires T-Comment plugin
" map <leader>c <c-_><c-_>
" Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l
" Set up an HTML5 template for all new .html files
autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl
autocmd BufRead,BufNewFile *.md set filetype=markdown
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
" Saves time; maps the spacebar to colon
nmap <space> :
" Automatically change current directory to that of the file in the buffer
" autocmd BufEnter * cd %:p:h
" Map code completion to , + tab
imap <leader><tab> <C-x><C-o>
" Map escape key to jj -- much faster
imap jj <esc>
" Delete all buffers (via Derek Wyatt)
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>
" Bubble single lines (kicks butt)
" http://vimcasts.org/episodes/bubbling-text/
nmap <C-k> ddkP
nmap <C-j> ddp
" Bubble multiple lines
vmap <C-k> xkP`[V`]
vmap <C-j> xp`[V`]
" Source the vimrc file after saving it. This way, you don't have to reload
" Vim to see the changes.
if has("autocmd")
 augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
 augroup END
endif
" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" "------------------------"
" "NERDTREE PLUGIN SETTINGS
" "------------------------"
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>

" Spelling corrects. Just for example. Add yours below.
iab teh the
iab Teh The
"  Get to home dir easier
" <leader>hm is easier to type than :cd ~
nmap <leader>hm :cd ~/ <CR>
" Alphabetically sort CSS properties in file with :SortCSS
:command! SortCSS :g#\({\n\)\@<=#.,/}/sort
" Shortcut to opening a virtual split to right of current pane
" Makes more sense than opening to the left
nmap <leader>bv :bel vsp
" Saves file when Vim window loses focus
" au FocusLost * :wa
" use xml syntax highlighting for .soy
au BufNewFile,BufRead *.soy set filetype=xml
" " Backups
"set backupdir=~/.vim/tmp/backup/ " backups
"set directory=~/.vim/tmp/swap/ " swap files
"set backup " enable backup
" " No more stretching for navigating files
"noremap h ;
"noremap j h
"noremap k gj
"noremap l gk
"noremap ; l
"set showmatch " show matching brackets

" Buildproj casino shortcuts
command! BP :!python app/sdk/tools/buildproj.py --updateDeps
command! BPP :!python app/sdk/tools/buildproj.py --preflight

" Toggle exuberant-ctags sidebar
nmap tb :TlistToggle<cr>

" lint js
" autocmd bufwritepost *.js !jshint <afile>

" For ctrlp.vim
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" Compile soy template
"au BufWrite */templates/*.soy !python mobile/tools/buildproj.py -genTemplate %:p
" Compile sass
"au BufWrite */stylesheets/*.scss !sass --update --force /Users/marcmauger/Documents/code/casino/branches/mobile/mobile/src/stylesheets/sass/:/Users/marcmauger/Documents/code/casino/branches/mobile/www/content/mobile/stylesheets 
set path+=app/src/**
set path+=app/sdk/libs/dd/**
set path+=build/www/application/**

" Go crazy!
if filereadable(expand("~/.vimrc.local"))
  " In your .vimrc.local, you might like:
  "
  " set autowrite
  " set nocursorline
  " set nowritebackup
  " set whichwrap+=<,>,h,l,[,] " Wrap arrow keys between lines
  "
  " autocmd! bufwritepost .vimrc source ~/.vimrc
  " noremap! jj <ESC>
  source ~/.vimrc.local
endif
