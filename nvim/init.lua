-- disable tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require "config/lazy"
require "config/options"
require "config/keymappings"
require "config/luasnip"
--require('lualine').setup()
require "config/nvim_cmp"
require "config/lualine"
require "config/tree"
