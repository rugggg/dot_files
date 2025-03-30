M = {
  "williamboman/mason.nvim",
  dependencies = {
	  "williamboman/mason-lspconfig.nvim"
  }
}
M.config = function ()
  require("mason").setup()
  require("mason-lspconfig").setup()
  local mason_registry = require("mason-registry")
  local ensure_installed = {
    "clangd",
    "codelldb",
    "clang-format",
    "cmake-language-server",
    "pyright",
    "black",
    "debugpy",
    "rust-analyzer"
  }

  for _, tool in ipairs(ensure_installed) do
    if not mason_registry.is_installed(tool) then
      vim.cmd("MasonInstall " .. tool)
    end
  end
end
return M
