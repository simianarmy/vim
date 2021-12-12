syntax on

set exrc
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
set signcolumn=yes

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
set scrolloff=8                                              " show context above/below cursorline
" Ever notice a slight lag after typing the leader key + command? This lowers
set timeoutlen=500
" Switch between buffers without saving
set hidden

" Tab stuff
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" Indent stuff
set smartindent
set autoindent
set wildmenu                                                 " show a navigable menu for tab completion
" Show command in bottom right portion of the screen
set showcmd
" Show lines numbers
set number
" Prefer relative line numbering?
set relativenumber
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
set completeopt=menuone,noinsert,noselect
set diffopt=vertical
" Terminal only
set modelines=1
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set path=.,packages/shared/src

" set up pathogen, https://github.com/tpope/vim-pathogen
set shell=zsh
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
  " color scheme
  Plug 'gruvbox-community/gruvbox'
  Plug 'sainnhe/gruvbox-material'
  Plug 'flazz/vim-colorschemes'
  " Enable after Neovim 0.5 for Telescope
  "Plug 'nvim-lua/popup.nvim'
  "Plug 'nvim-lua/plenary.nvim'
  "Plug 'nvim-telescope/telescope.nvim'

  " Enable after Neovim 0.6
  " Plug 'newvim/nvim-lspconfig'

  " fuzzy search
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'wookayin/fzf-ripgrep.vim'
  " fzf is more modern than ctrlp
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'sheerun/vim-polyglot'
  Plug 'scrooloose/nerdtree'
  Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
  Plug 'rbgrouleff/bclose.vim'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-fugitive'
  Plug 'scrooloose/nerdcommenter'
  Plug 'ElmCast/elm-vim'
  Plug 'pangloss/vim-javascript'
  Plug 'derekwyatt/vim-scala'
  Plug 'prettier/vim-prettier'
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  Plug 'gagoar/StripWhiteSpaces'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'mbbill/undotree'
  Plug 'vim-airline/vim-airline'
  Plug 'christoomey/vim-tmux-navigator'
  "Plug 'leafgarland/typescript-vim'
  "Plug 'mxw/vim-jsx'
  "Plug 'mattn/emmet-vim'
  "Choose Syntastic vs ALE for linting
  "Plug 'vim-syntastic/syntastic'
  "Plug 'burnettk/vim-angular'
  "Plug 'airblade/vim-gitgutter'
  "Plug 'janko-m/vim-test'
call plug#end()

filetype plugin indent on

set background=dark
highlight Normal guibg=none
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
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Want a different map leader than
let mapleader = ","
map <leader>l :Align
nmap <leader><space> :StripWhiteSpaces<CR>
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
" Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l
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

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" "------------------------"
" "NERDTREE PLUGIN SETTINGS
" "------------------------"
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.DS_Store', '\.idea', '\.git']
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>

" Ranger settings
let g:NERDTreeHijackNetrw = 1
let g:ranger_replace_netrw = 1 "open ranger when vim open a directory

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
"set showmatch " show matching brackets

"-------------------------
" Auto-complete
"-------------------------
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Elm bindings
nnoremap <leader>el :ElmEvalLine<CR>
vnoremap <leader>es :<C-u>ElmEvalSelection<CR>
nnoremap <leader>em :ElmMakeCurrentFile<CR>
" au BufWritePost *.elm ElmMakeFile("Main.elm")

set wildignore+=*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
set wildignore+=*/generated/*
set wildignore+=*.gz

" Emmet
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

"" fzf
nnoremap <C-p> :GFiles<CR>
nmap <Leader>t :GFiles<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>r :Tags<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <Leader>pf :Files<CR>

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
nnoremap <leader>j :call fzf#vim#tags("'".expand('<cword>'))<cr>

" surround word with quotes
nnoremap <Leader>q" ysiw"<CR>

" Sweet Sweet FuGITive
nmap <leader>gl :diffget //3<CR>
nmap <leader>ga :diffget //2<CR>
nmap <leader>gs :G<CR>

" CoC configs
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

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

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

command! -nargs=0 Prettier :CocCommand prettier.formatFile

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use <c-space> to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()

" code actions on word under cursor
nmap <leader>do <Plug>(coc-codeaction)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)

" search word under cursor
nnoremap <e texteader>k :exe 'Ag!' expand('<cword>')<cr>

" Yank to end of line
nnoremap Y y$

" Keep <next> centered
nnoremap n nzzzv
nnoremap  Nzzzv
nnoremap J mzJ`z

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Moving lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

" These should go in the work machine's .vimrc.local
command! JSON :%!python -m json.tool
command! JSCS :%!jscs -x %

" AutoCommands

if ! has('gui_running')
   set ttimeoutlen=10
   augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
   augroup END
endif

" Set up an HTML5 template for all new .html files
autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl
autocmd BufRead,BufNewFile *.md set filetype=markdown
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Source the vimrc file after saving it. This way, you don't have to reload
" Vim to see the changes.
if has("autocmd")
 augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
 augroup END
endif

au BufRead,BufNewFile *.sbt,*.sc set filetype=scala

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

