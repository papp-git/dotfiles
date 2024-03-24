require("luasnip").config.set_config({
    enable_autosnippets = true,
    store_selection_keys = "<Tab>", --trigger visual selection
    update_events = 'TextChanged,TextChangedI',	--update rep node 
})
require("luasnip.loaders.from_lua").lazy_load({paths="~/.config/nvim/snippets"})
