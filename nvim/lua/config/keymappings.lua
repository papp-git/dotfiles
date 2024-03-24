-- speichern
vim.keymap.set('n', 'jj',':update<CR>')		
vim.keymap.set('i','jj','<esc>:update<CR>')

-- klammern
vim.keymap.set('i', '(', '()<left>')
vim.keymap.set('i', '[', '[]<left>')
vim.keymap.set('i', '{', '{}<left>')
vim.keymap.set('i', '"', '""<left>')

-- luasnip
local ls = require("luasnip")

vim.keymap.set({"i"}, "<C-s>", function() ls.expand() end, {silent = true})	--expand
vim.keymap.set({"i", "s"}, "<C-s>", function() ls.jump( 1) end, {silent = true})--vorwärts
vim.keymap.set({"i", "s"}, "<C-r>", function() ls.jump(-1) end, {silent = true})--ruckwärts

vim.keymap.set({"i", "s"}, "<C-e>", function()	--aktuelle Wahl ändern
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})
