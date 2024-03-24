local opt = vim.opt

opt.number = true 	-- Print line number
opt.shiftwidth = 4 	-- Size of an indent
opt.smartindent = true 	-- Insert indents automatically

opt.showmatch = true 	-- Klammern zeigen

opt.spelllang= {"de"}

opt.clipboard = "unnamedplus" 	-- Sync mit Systemclipboard
opt.autochdir = true		-- aktuelles Verzeichnis

opt.cursorline = true		-- Cursor horizontal
opt.cursorcolumn = true		-- Cursor vertikal

opt.termguicolors = true 	-- farben aktivieren

opt.bg="light"
require("gruvbox").load()
