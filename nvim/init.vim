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

nnoremap <silent> <leader>gs :10split<Bar>0Gstatus<CR>
nnoremap <silent> <leader>gd :Gvdiff<CR> " always split vertically
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Gpush<CR>
nnoremap <silent> <leader>gw :Gwrite<CR> " adds the current file
nnoremap <silent> <leader>ga :Gwrite<CR> " to make it feel like git add
nnoremap <silent> <leader>grm :Gdelete!<CR>

nnoremap <silent> <Leader>dg :diffget<CR>
nnoremap <silent> <Leader>dp :diffput<CR>

call plug#end()

" visual.
"
set number
set cursorline

set termguicolors
colorscheme base16-tomorrow-night-eighties
highlight LineNr guifg=grey guibg=#2d2d2d
