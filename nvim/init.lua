-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local config_dir = vim.fn.stdpath('config')
local autocmds_path = config_dir .. '/lua/autocmds.lua'
print("Attempting to load from: " .. autocmds_path)

local ok, err = pcall(function()
  dofile(autocmds_path)
end)

-- Open a terminal in a horizontal split
vim.api.nvim_set_keymap('n', '<leader>th', ':split | terminal<CR>', {noremap = true, silent = true})
-- Open a terminal in a vertical split
vim.api.nvim_set_keymap('n', '<leader>tv', ':vsplit | terminal<CR>', {noremap = true, silent = true})


require("lazy").setup("plugins")



