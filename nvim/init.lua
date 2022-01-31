-- leader settings
vim.g.mapleader = ' '
vim.g.localmapleader = ' '

-- plugins
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
end)

