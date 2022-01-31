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
-- vim.cmd "silent !mkdir ~/.vim_undo > /dev/null 2>&1"
-- vim.opt.undodir = "~/.vim_undo"
-- vim.opt.undofile = true

-- swp files.
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- plugins
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {'folke/tokyonight.nvim', config = function() vim.cmd "colorscheme tokyonight" end}
end)
