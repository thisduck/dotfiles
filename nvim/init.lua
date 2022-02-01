-- leader settings.
vim.g.mapleader = " "
vim.g.localmapleader = " "

-- visual.
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 2
vim.opt.termguicolors = true
vim.cmd [[set list listchars=tab:▸\ ,trail:·]]

-- mouse.
vim.opt.mouse = "a"

-- search.
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.cmd "nnoremap // :nohlsearch<CR>"

vim.opt.inccommand = "nosplit"

-- windows/buffers.
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.hidden = true
vim.opt.equalalways = false
vim.cmd "set diffopt+=vertical"

-- indenting.
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true

-- persistent undo.
vim.cmd "silent !mkdir ~/.vim_undo > /dev/null 2>&1"
vim.opt.undodir = vim.fn.stdpath "data" .. "/vim_undo"
vim.opt.undofile = true

-- swp files.
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- timeouts.
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 300
vim.opt.updatetime = 250

-- return to the last file location.
vim.cmd [[autocmd BufRead * autocmd FileType <buffer> ++once if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif]]

-- plugins
vim.cmd [[packadd packer.nvim]]

-- Shortcut for sourcing and running packer.
vim.cmd [[nnoremap <Leader>i <cmd>source ~/.config/nvim/init.lua <bar> PackerSync<CR>]]

require("packer").startup(function()
  -- Packer can manage itself
  use "wbthomason/packer.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = "maintained",
        sync_install = false,
        highlight = {
          enable = true,
        },
      }
    end,
  }

  -- visuals.
  use {
    "navarasu/onedark.nvim",
    config = function()
      vim.cmd "colorscheme onedark"
    end,
  }

  use "arkav/lualine-lsp-progress"
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      local gps = require "nvim-gps"
      require("lualine").setup {
        options = {
          theme = "onedark",
        },
        sections = {
          lualine_c = { "filename", "lsp_progress", { gps.get_location, cond = gps.is_available } },
        },
        extensions = { "quickfix", "nerdtree", "fugitive", "symbols-outline" },
      }
    end,
  }

  -- project.
  use {
    "Shatur/neovim-session-manager",
    config = function()
      local Path = require "plenary.path"
      require("session_manager").setup {
        sessions_dir = Path:new(vim.fn.stdpath "data", "sessions"),
        path_replacer = "__",
        colon_replacer = "++",
        autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
        autoload_last_session = false,
        autosave_last_session = true,
        autosave_ignore_not_normal = true,
        autosave_ignore_filetypes = { "gitcommit" },
        autosave_only_in_session = false,
      }
    end,
  }

  use {
    "mhinz/vim-startify",
    config = function()
      vim.cmd [[let g:startify_change_to_vcs_root = 1]]
      vim.g["startify_session_dir"] = vim.fn.stdpath "data" .. "/sessions"
      vim.cmd [[let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ] ]]
    end,
  }

  use {
    "airblade/vim-rooter",
    config = function()
      vim.cmd [[ let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh'] ]]
    end,
  }

  -- motion.
  use {
    "phaazon/hop.nvim",
    config = function()
      require("hop").setup {}

      vim.cmd [[map ; <cmd>HopChar1<CR>]]
      vim.cmd [[map <Leader>w <cmd>HopWord<CR>]]
      vim.cmd [[map <Leader>j <cmd>HopLineStartAC<CR>]]
      vim.cmd [[map <Leader>k <cmd>HopLineStartBC<CR>]]
      vim.cmd [[highlight HopNextKey2 guifg=darkgrey guibg=#2d2d2d]]
    end,
  }

  -- IDE.
  use {
    "simnalamburt/vim-mundo",
    config = function()
      vim.cmd [[nnoremap <Leader>u :MundoToggle<CR>]]
    end,
  }
  use "tomtom/tcomment_vim"
  use "rstacruz/vim-closer"
  use {
    "andymass/vim-matchup",
    event = "VimEnter",
    config = function()
      vim.cmd [[nnoremap <c-k> <cmd>MatchupWhereAmI?<cr>]]
    end,
  }

  use {
    "akinsho/toggleterm.nvim",
    config = function()
      vim.cmd [[let g:toggleterm_terminal_mapping = '<C-t>']]
      vim.cmd [[tnoremap <silent>jk <C-\><C-n>]]
      vim.cmd [[nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>]]
      vim.cmd [[inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>]]
    end,
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end,
  }

  -- Copy/Paste.
  use {
    "machakann/vim-highlightedyank",
    config = function()
      vim.cmd [[let g:highlightedyank_highlight_duration = 600]]
    end,
  }

  use {
    "svermeulen/vim-yoink",
    config = function()
      vim.cmd [[nmap <c-n> <plug>(YoinkPostPasteSwapBack)]]
      -- vim.cmd [[nmap <c-p> <plug>(YoinkPostPasteSwapForward)]]
      vim.cmd [[nmap p <plug>(YoinkPaste_p)]]
      vim.cmd [[nmap P <plug>(YoinkPaste_P)]]
      vim.cmd [[nmap y <plug>(YoinkYankPreserveCursorPosition)]]
      vim.cmd [[xmap y <plug>(YoinkYankPreserveCursorPosition)]]
    end,
  }

  use {
    "svermeulen/vim-subversive",
    config = function()
      vim.cmd [[nmap s <plug>(SubversiveSubstitute)]]
      vim.cmd [[nmap ss <plug>(SubversiveSubstituteLine)]]
      vim.cmd [[nmap S <plug>(SubversiveSubstituteToEndOfLine)]]
      vim.cmd [[xmap s <plug>(SubversiveSubstitute)]]
      vim.cmd [[xmap p <plug>(SubversiveSubstitute)]]
      vim.cmd [[xmap P <plug>(SubversiveSubstitute)]]
      vim.cmd [[nmap <leader>s <plug>(SubversiveSubstituteRange)]]
      vim.cmd [[xmap <leader>s <plug>(SubversiveSubstituteRange)]]
      vim.cmd [[nmap <leader>ss <plug>(SubversiveSubstituteWordRange)]]
      vim.cmd [[nmap <leader>r <plug>(SubversiveSubstituteRangeNoPrompt)]]
      vim.cmd [[xmap <leader>r <plug>(SubversiveSubstituteRangeNoPrompt)]]
      vim.cmd [[nmap <leader>rr <plug>(SubversiveSubstituteWordRangeNoPrompt)]]
    end,
  }

  -- text objects.
  use {
    "kana/vim-textobj-user",
    "kana/vim-textobj-entire",
    "kana/vim-textobj-fold",
    "kana/vim-textobj-function",
    "kana/vim-textobj-lastpat",
    "kana/vim-textobj-line",
    "michaeljsmith/vim-indent-object",
    "beloglazov/vim-textobj-quotes",
    "coderifous/textobj-word-column.vim",
    "Julian/vim-textobj-variable-segment",
    "haya14busa/vim-textobj-function-syntax",
  }

  -- improvements.

  use "tpope/vim-surround"
  use "tpope/vim-repeat"
  use "tpope/vim-unimpaired"

  -- search and navigation.

  use {
    "preservim/nerdtree",
    config = function()
      vim.cmd [[map <Leader>nt :NERDTreeToggle<CR>]]
      vim.cmd [[map <Leader>nf :NERDTreeFind<CR>]]
      vim.cmd [[let NERDTreeShowHidden=1]]
    end,
  }

  -- git.

  use {
    "sindrets/diffview.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      vim.cmd [[nnoremap <silent> <Leader>dv :DiffviewOpen<CR>]]
      vim.cmd [[nnoremap <silent> <Leader>df :DiffviewFileHistory<CR>]]
    end,
  }

  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
          map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

          -- Actions
          map({ "n", "v" }, "<leader>hs", gs.stage_hunk)
          map({ "n", "v" }, "<leader>hr", gs.reset_hunk)
          map("n", "<leader>hS", gs.stage_buffer)
          map("n", "<leader>hu", gs.undo_stage_hunk)
          map("n", "<leader>hR", gs.reset_buffer)
          map("n", "<leader>hp", gs.preview_hunk)
          map("n", "<leader>hb", function()
            gs.blame_line { full = true }
          end)
          map("n", "<leader>tb", gs.toggle_current_line_blame)
          map("n", "<leader>hd", gs.diffthis)
          map("n", "<leader>hD", function()
            gs.diffthis "~"
          end)
          map("n", "<leader>td", gs.toggle_deleted)

          -- Text object
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        end,
      }
    end,
  }
  use "Xuyuanp/nerdtree-git-plugin"

  use "tpope/vim-rhubarb"
  use "tpope/vim-git"
  use {
    "tpope/vim-fugitive",
    config = function()
      vim.cmd [[nnoremap <silent> <Leader>gs :10split<Bar>0Git<CR>]]
      vim.cmd [[nnoremap <silent> <Leader>gd :Gvdiff<CR> " always split vertically]]
      vim.cmd [[nnoremap <silent> <Leader>gc :Git commit<CR>]]
      vim.cmd [[nnoremap <silent> <Leader>gb :Git blame<CR>]]
      vim.cmd [[nnoremap <silent> <Leader>gl :Gclog %<CR>]]
      vim.cmd [[nnoremap <silent> <Leader>gp :Git push<CR>]]
      vim.cmd [[nnoremap <silent> <Leader>gw :Gwrite<CR> " adds the current file]]
      vim.cmd [[nnoremap <silent> <Leader>ga :Gwrite<CR> " to make it feel like git add]]
      vim.cmd [[nnoremap <silent> <Leader>grm :Gdelete!<CR>]]

      vim.cmd [[nnoremap <silent> <Leader>dg :diffget<CR>]]
      vim.cmd [[nnoremap <silent> <Leader>dp :diffput<CR>]]
    end,
  }

  -- search.
  use "haya14busa/is.vim"

  use {
    "nvim-telescope/telescope.nvim",
    config = function()
      vim.cmd [[nnoremap <Leader>/ :lua require('telescope.builtin').grep_string({ search = vim.fn.input("> ")})<CR>]]
      vim.cmd [[nnoremap <Leader><tab> <cmd>lua require('telescope.builtin').keymaps()<cr>]]
      vim.cmd [[nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy({}))<cr>]]
      vim.cmd [[nnoremap <Leader>bs :lua require('telescope.builtin').buffers()<CR>]]
      vim.cmd [[nnoremap <Leader>he :lua require('telescope.builtin').help_tags()<CR>]]
      vim.cmd [[nnoremap <silent>K <cmd>lua require('telescope.builtin').grep_string()<cr>]]
      require "dotfiles.telescope"
    end,
  }
  use "nvim-telescope/telescope-fzy-native.nvim"

  -- language/framework support.
  use "sheerun/vim-polyglot"

  -- focus.
  use {
    "chrisbra/nrrwrgn",
    "troydm/zoomwintab.vim",
  }

  -- rest controls
  use "diepm/vim-rest-console"

  -- lsp.
  use "neovim/nvim-lspconfig"
  use {
    "williamboman/nvim-lsp-installer",
    config = function()
      require "dotfiles.lsp"
    end,
  }
  use "tamago324/nlsp-settings.nvim"
  use {
    "zeertzjq/symbols-outline.nvim",
    branch = "patch-1",
    config = function()
      vim.g.symbols_outline = {
        width = 30,
      }
    end,
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end,
  }
  use {
    "SmiteshP/nvim-gps",
    config = function()
      require("nvim-gps").setup()
    end,
  }
  use {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup {}
    end,
  }
  use "tami5/lspsaga.nvim"
  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("null-ls").setup {
        sources = {
          require("null-ls").builtins.formatting.stylua,
          require("null-ls").builtins.formatting.eslint_d,
          require("null-ls").builtins.formatting.prettier,
        },
        on_attach = function(client)
          if client.resolved_capabilities.document_formatting then
            vim.cmd [[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 4000)
            augroup END
            ]]
          end
        end,
      }
    end,
  }

  -- completion.
  use "hrsh7th/vim-vsnip"
  use "rafamadriz/friendly-snippets"

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
    config = function()
      require "dotfiles.cmp"
    end,
  }
end)
