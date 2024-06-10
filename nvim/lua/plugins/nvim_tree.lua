
local M = {
  "nvim-tree/nvim-tree.lua",
}

M.config = function() 
  require("nvim-tree").setup({
	  sort = {
	    sorter = "case_sensitive",
	  },
	  view = {
	    width = 30,
	  },
	  renderer = {
	    group_empty = true,
	  },
	  filters = {
	    dotfiles = true,
	  },
  })
local nt_api = require("nvim-tree.api")

-- Set the default state to closed
local tree_open = false

-- Function to toggle the tree open or closed
local function toggle_tree(state)
  if state then
    nt_api.tree.open()
  else
    nt_api.tree.close()
  end
end

-- Subscribe to the TreeOpen and TreeClose events
nt_api.events.subscribe(nt_api.events.Event.TreeOpen, function()
  tree_open = true
end)

nt_api.events.subscribe(nt_api.events.Event.TreeClose, function()
  tree_open = false
end)

-- Set up an autocmd to toggle the tree open or closed when switching tabs
vim.api.nvim_create_autocmd("TabEnter", {
  callback = function()
    toggle_tree(tree_open)
  end
})

end
return M
