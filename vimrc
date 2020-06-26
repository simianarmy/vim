syntax on

set guicursor=
set noshowmatch
set nohlsearch
set noerrorbells
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" set colorcolumn=80
" highlight ColorColumn ctermbg=0 guibg=lightgrey

set termguicolors

" These lines setup the environment to show graphics and colors correctly.
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" Set font type and size. Depends on the resolution. Larger screens, prefer h20
set guifont=Fira\ Code:h12
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" Write the old file out when switching between files.
set autowrite
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set visualbell
" Display current cursor position in lower right corner.
set ruler
set scrolloff=3                                              " show context above/below cursorline
" Ever notice a slight lag after typing the leader key + command? This lowers
set timeoutlen=500
" Switch between buffers without saving
set hidden

" Tab stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set wildmenu                                                 " show a navigable menu for tab completion
" Show command in bottom right portion of the screen
set showcmd
" Show lines numbers
set number
" Prefer relative line numbering?
" set relativenumber
" Indent stuff
set smartindent
set autoindent
" Always show the status line
set laststatus=2
" Prefer a slightly higher line height
" set linespace=3
" set textwidth=79
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

" Enable code folding
set foldenable
" Hide mouse when typing
set mousehide
" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX') && !has('nvim')  " Support resizing in tmux
  set ttymouse=xterm2
endif
" Split windows below the current window.
set splitbelow
"  session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help
" Auto-completion menu
set wildmode=longest,list,full
" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone
set diffopt=vertical
" Terminal only
set modelines=1


" set up pathogen, https://github.com/tpope/vim-pathogen
set shell=zsh
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=/Users/marc.mauger/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()
  Plugin 'gmarik/Vundle.vim'
  " color scheme
  Plugin 'gruvbox-community/gruvbox'
  Plugin 'sainnhe/gruvbox-material'
  Plugin 'flazz/vim-colorschemes'
  " fuzzy search
  Plugin 'junegunn/fzf'
  Plugin 'junegunn/fzf.vim'
  " fzf is more modern than ctrlp
  Plugin 'neoclide/coc.nvim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'tpope/vim-surround'
  Plugin 'tpope/vim-unimpaired'
  Plugin 'tpope/vim-repeat'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-projectionist'
  Plugin 'tpope/vim-dispatch.git'
  Plugin 'mileszs/ack.vim'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'ElmCast/elm-vim'
  Plugin 'burnettk/vim-angular'
  Plugin 'pangloss/vim-javascript'
  Plugin 'leafgarland/typescript-vim'
  Plugin 'mxw/vim-jsx'
  Plugin 'mattn/emmet-vim'
  " Choose Syntastic vs ALE for linting
  " Plugin 'w0rp/ale'
  Plugin 'vim-syntastic/syntastic'
  Plugin 'prettier/vim-prettier'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'JamshedVesuna/vim-markdown-preview'
  Plugin 'gagoar/StripWhiteSpaces'
  Plugin 'editorconfig/editorconfig-vim'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'janko-m/vim-test'
call vundle#end()            " required
filetype plugin indent on

set background=dark
colorscheme gruvbox

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:minBufExplForceSyntaxEnable = 1
" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup

if ! has('gui_running')
   set ttimeoutlen=10
   augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
   augroup END
endif

" Want a different map leader than
let mapleader = ","
map <leader>l :Align
nmap <leader>] :TagbarToggle<CR>
nmap <leader><space> :StripWhiteSpaces<CR>
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
" use xml syntax highlighting for .soy
autocmd BufNewFile,BufRead *.soy set filetype=xml
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
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]
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

" invert line numbers display
nmap <leader>n :set invnumber<CR>

" Spelling corrects. Just for example. Add yours below.
iab teh the
iab Teh The
"  Get to home dir easier
" <leader>hm is easier to type than :cd ~
nmap <leader>hm :cd ~/ <CR>
" Shortcut to opening a virtual split to right of current pane
" Makes more sense than opening to the left
nmap <leader>bv :bel vsp
" Saves file when Vim window loses focus
" au FocusLost * :wa
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

"-------------------------
" Auto-complete
"-------------------------
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" lint js
" autocmd bufwritepost *.js !jshint <afile>

" syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

" Elm bindings
nnoremap <leader>el :ElmEvalLine<CR>
vnoremap <leader>es :<C-u>ElmEvalSelection<CR>
nnoremap <leader>em :ElmMakeCurrentFile<CR>
" au BufWritePost *.elm ElmMakeFile("Main.elm")

set wildignore+=*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
set wildignore+=*/generated/*
set wildignore+=*.gz

"-------------------------
" Ag
"-------------------------
map <Leader>f <ESC>:tabnew<CR>:Ag
map <Leader>F <ESC>:Ag
map <Leader>fs <ESC>:tabnew<CR>:AgFromSearch<CR>

"-------------------------
"" NERDTree
"-------------------------
let NERDTreeIgnore = ['\.DS_Store', '\.idea', '\.git']
"let NERDTreeQuitOnOpen = 1
map <Leader>d :NERDTreeToggle<CR>
map <Leader>D :NERDTreeFind<CR>

" Markdown browser hotkey
let vim_markdown_preview_hotkey='<C-M>'

" Prettier: Run before saving async
let g:prettier#autoformat = 1
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" Prettier default: false
let g:prettier#config#single_quote = 'false'

" Prettier default: true
let g:prettier#config#bracket_spacing = 'true'

" Prettier default: false
let g:prettier#config#jsx_bracket_same_line = 'false'

" Prettier default: none
let g:prettier#config#trailing_comma = 'none'

" Prettier default: babylon
let g:prettier#config#parser = 'babylon'

" Emmet
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}


" TODO
" These should go in the work machine's .vimrc.local
command! JSON :%!python -m json.tool
command! JSCS :%!jscs -x %

"--
"" fzf
nmap ; :Buffers<CR>
nnoremap <C-p> :GFiles<CR>
nmap <Leader>t :GFiles<CR>
nmap <Leader>r :Tags<CR>

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" surround work with quotes
nnoremap <Leader>q" ysiw"<CR>

" coc
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart

" Sweet Sweet FuGITive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>


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

set exrc
set secure

