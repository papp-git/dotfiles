local opt = vim.opt

-- Theme----------------
require("everforest").load()

opt.number = true 	-- Print line number
opt.shiftwidth = 4 	-- Size of an indent
opt.softtabstop = 4	-- tab 4 zeichen
opt.smartindent = true 	-- Insert indents automatically

opt.showmatch = true 	-- Klammern zeigen

opt.spelllang= 'de_de','en'
opt.spell = true

opt.clipboard = "unnamedplus" 	-- Sync mit Systemclipboard
opt.autochdir = true		-- aktuelles Verzeichnis

opt.cursorline = true		-- Cursor horizontal
opt.cursorcolumn = true		-- Cursor vertikal
opt.colorcolumn = '80'		-- markierung

-- hard-wrap
opt.wrap = true
--opt.textwidth = 80		-- hat keinen Effekt; wir durch ftplugin
--überschrieben
opt.linebreak = true
opt.breakindent = true  

opt.termguicolors = true 	-- mehr farben

opt.lazyredraw = true 	-- schnelleres scrollen

opt.bg="dark"


-- disable tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
