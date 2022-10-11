local status, lsp = pcall(require, "lspconfig")
if (not status) then return end

local pid = vim.fn.getpid()
local omnisharp_bin = "C:/Omnisharp/OmniSharp.exe"

require'lspconfig'.omnisharp.setup{
  cmd = { omnisharp_bin, "languageserver", "hostPID", tostring(pid) };
  root_dir = lsp.util.root_pattern("*.csproj", "*.sln");
}
