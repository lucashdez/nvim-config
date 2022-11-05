require('craftzdog.base')
require('craftzdog.highlights')
require('craftzdog.maps')
require('craftzdog.plugins')

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"

local is_neovide = has "g:neovide"



if is_mac then
  require('craftzdog.macos')
end
if is_win then
  require('craftzdog.windows')
end

if is_neovide then
  vim.cmd([[let g:neovide_transparency=0.85]])
end
