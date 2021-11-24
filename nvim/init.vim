let mapleader = ' '
let localmapleader = ' '

" plugins.
"
call plug#begin('~/.config/nvim/plugged')
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" visual.
"
Plug 'chriskempson/base16-vim'
Plug 'Th3Whit3Wolf/one-nvim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
 
" IDE. 
" 
Plug 'mhinz/vim-startify'
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

Plug 'simnalamburt/vim-mundo'
nnoremap <Leader>u :MundoToggle<CR>

Plug 'airblade/vim-rooter'
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
map <Leader><Leader>w <Plug>(easymotion-bd-w)
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
nmap s <plug>(SubversiveSubstitute)
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
Plug 'kana/vim-textobj-lastpat'
Plug 'kana/vim-textobj-line'
Plug 'michaeljsmith/vim-indent-object'
Plug 'beloglazov/vim-textobj-quotes'
Plug 'coderifous/textobj-word-column.vim'
Plug 'Julian/vim-textobj-variable-segment'

Plug 'tpope/vim-surround'

" improvements.
"
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'

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

nnoremap <silent> <Leader>gs :10split<Bar>0Git<CR>
nnoremap <silent> <Leader>gd :Gvdiff<CR> " always split vertically
nnoremap <silent> <Leader>gc :Gcommit<CR>
nnoremap <silent> <Leader>gb :Git blame<CR>
nnoremap <silent> <Leader>gl :Glog<CR>
nnoremap <silent> <Leader>gp :Gpush<CR>
nnoremap <silent> <Leader>gw :Gwrite<CR> " adds the current file
nnoremap <silent> <Leader>ga :Gwrite<CR> " to make it feel like git add
nnoremap <silent> <Leader>grm :Gdelete!<CR>

nnoremap <silent> <Leader>dg :diffget<CR>
nnoremap <silent> <Leader>dp :diffput<CR>

" search.
"
Plug 'haya14busa/is.vim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'down': '40%' }

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" nnoremap <Leader>/ :FzfRg<Space>
" nmap <leader><tab> <plug>(fzf-maps-n)
" nnoremap <C-p> :FzfFiles<CR>
" nnoremap <C-p> <cmd>Telescope find_files<cr>
" nnoremap <Leader>bs :FzfBuffers<CR>
" nnoremap <Leader>he :FzfHelptags<CR>
" nnoremap <silent>K :FzfRg \b<C-r><C-w>\b<CR>

nnoremap <Leader>/ :lua require('telescope.builtin').grep_string({ search = vim.fn.input("> ")})<CR>
nnoremap <Leader><tab> <cmd>lua require('telescope.builtin').keymaps()<cr>
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy({}))<cr>
nnoremap <Leader>bs :lua require('telescope.builtin').buffers()<CR>
nnoremap <Leader>he :lua require('telescope.builtin').help_tags()<CR>

nnoremap <silent>K <cmd>lua require('telescope.builtin').grep_string()<cr>

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" language/framework support.
"
Plug 'kevinoid/vim-jsonc'
Plug 'jparise/vim-graphql'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'dustinfarris/vim-htmlbars-inline-syntax'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'pantharshit00/vim-prisma'
Plug 'posva/vim-vue'


" language server.
"
Plug 'neoclide/coc.nvim', {'branch': 'release'}

inoremap <silent><expr> <C-n> coc#refresh()

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ?
      \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_disable_transparent_cursor = 1

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gf <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format)

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

nnoremap <silent> L :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

let g:coc_global_extensions = [
\ 'coc-json',
\ 'coc-tsserver',
\ 'coc-angular',
\ 'coc-css',
\ 'coc-ember',
\ 'coc-emmet',
\ 'coc-fzf-preview',
\ 'coc-git',
\ 'coc-gist',
\ 'coc-highlight',
\ 'coc-html',
\ 'coc-java',
\ 'coc-snippets',
\ 'coc-solargraph',
\ 'coc-sql',
\ 'coc-svelte',
\ 'coc-svg',
\ 'coc-tailwindcss',
\ 'coc-prettier',
\ 'coc-eslint',
\ ]
Plug 'yaegassy/coc-volar', {'do': 'yarn install --frozen-lockfile'}

" snippets.
" Plug 'SirVer/ultisnips'
" let g:UltiSnipsExpandTrigger='<S-Tab>'
Plug 'honza/vim-snippets'

Plug 'diepm/vim-rest-console'

" focus
Plug 'chrisbra/nrrwrgn'
Plug 'troydm/zoomwintab.vim'

call plug#end()

" visual.
"
set number
set cursorline
set signcolumn=yes
set cmdheight=2

" mouse.
"
set mouse=a

" search.
"
set ignorecase
set smartcase
nnoremap // :nohlsearch<CR>

set inccommand=nosplit

" Display tabs and trailing spaces visually
set list listchars=tab:▸\ ,trail:·

set termguicolors
" colorscheme base16-tomorrow-night-eighties
colorscheme one-nvim
highlight LineNr guifg=grey guibg=#2d2d2d
highlight SignColumn guifg=grey guibg=#2d2d2d

" windows/buffers.
"
set splitbelow
set splitright
set hidden
set noequalalways

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
autocmd TermOpen * setlocal nonumber

let g:term_buf = 0
let g:term_win = 0

function! Term_toggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

nnoremap <M-t> :call Term_toggle(10)<cr>
tnoremap <M-t> <C-\><C-n>:call Term_toggle(10)<cr>

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

" Return to the last file location.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


let NERDTreeShowHidden=1
lua require('dotfiles.telescope')

" Setup for root dir
let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh']
