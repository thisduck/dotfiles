let mapleader = ' '
let localmapleader = ' '

" plugins.
"
call plug#begin('~/.config/nvim/plugged')
" visual.
"
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1 

" IDE.
"
Plug 'mhinz/vim-startify'
Plug 'tomtom/tcomment_vim'

" motion.
"
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

map ; <Plug>(easymotion-bd-f)

map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>w <Plug>(easymotion-w)
map <Leader>b <Plug>(easymotion-b)
map <Leader>e <Plug>(easymotion-bd-e)

" copy paste.
"
Plug 'machakann/vim-highlightedyank'
let g:highlightedyank_highlight_duration = 600

Plug 'svermeulen/vim-yoink'
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)

Plug 'svermeulen/vim-subversive'
nmap s <nmap>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)
xmap s <plug>(SubversiveSubstitute)
xmap p <plug>(SubversiveSubstitute)
xmap P <plug>(SubversiveSubstitute)
nmap <leader>s <plug>(SubversiveSubstituteRange)
xmap <leader>s <plug>(SubversiveSubstituteRange)
nmap <leader>ss <plug>(SubversiveSubstituteWordRange)
nmap <leader>r <plug>(SubversiveSubstituteRangeNoPrompt)
xmap <leader>r <plug>(SubversiveSubstituteRangeNoPrompt)
nmap <leader>rr <plug>(SubversiveSubstituteWordRangeNoPrompt)

" text objects.
"
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-lastpat'
Plug 'beloglazov/vim-textobj-quotes'
Plug 'idbrii/textobj-word-column.vim'

Plug 'tpope/vim-surround'

" improvements.
"
Plug 'tpope/vim-repeat'

" search and navigation.
"
Plug 'preservim/nerdtree'

map <Leader>nt :NERDTreeToggle<CR>
map <Leader>nf :NERDTreeFind<CR>

" git.
"
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-git'

nnoremap <silent> <Leader>gs :10split<Bar>0Gstatus<CR>
nnoremap <silent> <Leader>gd :Gvdiff<CR> " always split vertically
nnoremap <silent> <Leader>gc :Gcommit<CR>
nnoremap <silent> <Leader>gb :Gblame<CR>
nnoremap <silent> <Leader>gl :Glog<CR>
nnoremap <silent> <Leader>gp :Gpush<CR>
nnoremap <silent> <Leader>gw :Gwrite<CR> " adds the current file
nnoremap <silent> <Leader>ga :Gwrite<CR> " to make it feel like git add
nnoremap <silent> <Leader>grm :Gdelete!<CR>

nnoremap <silent> <Leader>dg :diffget<CR>
nnoremap <silent> <Leader>dp :diffput<CR>

call plug#end()

" visual.
"
set number
set cursorline
set signcolumn=yes

" Display tabs and trailing spaces visually
set list listchars=tab:▸\ ,trail:·

set termguicolors
colorscheme base16-tomorrow-night-eighties
highlight LineNr guifg=grey guibg=#2d2d2d
highlight SignColumn guifg=grey guibg=#2d2d2d

" windows/buffers.
"
set splitbelow
set splitright
set hidden

" indenting.
"
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" terminal.
"
tnoremap jk <C-\><C-n>
highlight TermCursorNC ctermbg=238  guibg=#888888

" persistent undo.
"
silent !mkdir ~/.vim_undo > /dev/null 2>&1
set undodir=~/.vim_undo
set undofile

" misc settings.
"
set timeoutlen=300
set ttimeoutlen=300
set updatetime=250

" prefer vertical orientation when using :diffsplit
set diffopt+=vertical

" We don't want those `.swp` files while we're editing.
set noswapfile
set nobackup
set nowb

" Toggle setpaste
nnoremap <Leader>p :set invpaste<CR>:set paste?<CR>
