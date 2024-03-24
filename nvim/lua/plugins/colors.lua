return { 
  -- Plugins will be added here accordingly.
    {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  -- Optional; default configuration will be used if setup isn't called.
  config = function()
      require("everforest").setup({
      -- Your config here
    })
  end,
},
    { 
       "ellisonleao/gruvbox.nvim", 
	lazy =false, -- make sure we load this during startup if it is your main colorscheme
	--priority = 1000 , -- make sure to load this before all the other start plugins
	config = function()
	end,
  },
  

}
