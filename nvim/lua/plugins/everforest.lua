M = {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000,
}
M.config = function()
	vim.cmd([[colorscheme everforest]])
end
return M 
