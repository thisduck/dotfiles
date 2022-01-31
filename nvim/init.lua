-- leader settings.
vim.g.mapleader = ' '
vim.g.localmapleader = ' '

-- visual.
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 2
vim.opt.termguicolors = true

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

-- return to the last file location.
vim.cmd [[autocmd BufRead * autocmd FileType <buffer> ++once if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif]]

-- plugins
vim.cmd [[packadd packer.nvim]]

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'

  -- visuals.
  use {'folke/tokyonight.nvim', config = function() vim.cmd "colorscheme tokyonight" end}
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'tokyonight'
        }
      }
    end
  }

  -- project.
  use {
    'Shatur/neovim-session-manager',
    config = function ()
      local Path = require('plenary.path')
      require('session_manager').setup({
        sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'),
        path_replacer = '__',
        colon_replacer = '++',
        autoload_mode = require('session_manager.config').AutoloadMode.LastSession,
        autosave_last_session = true,
        autosave_ignore_not_normal = true,
        autosave_ignore_filetypes = { 'gitcommit' }, 
        autosave_only_in_session = false,
      })
    end
  }

  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
      require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  }

  use {
    'airblade/vim-rooter',
    config = function()
      vim.cmd[[ let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh'] ]]
    end
  }

end)
