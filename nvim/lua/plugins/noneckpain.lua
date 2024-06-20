local M = {"shortcuts/no-neck-pain.nvim", version = "*"}
M.config = function()
	require("no-neck-pain").setup({
		autocmds = {
			enableOnVimEnter = true
		}
	})
end
return M
