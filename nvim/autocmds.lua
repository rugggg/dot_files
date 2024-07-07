local function set_indent(spaces)
  vim.bo.expandtab = true
  vim.bo.shiftwidth = spaces
  vim.bo.tabstop = spaces
  vim.bo.softtabstop = spaces
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"c", "cpp", "cuda"},
  callback = function() set_indent(2) end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function() set_indent(4) end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"javascript", "typescript", "javascriptreact", "typescriptreact"},
  callback = function() set_indent(2) end
})
