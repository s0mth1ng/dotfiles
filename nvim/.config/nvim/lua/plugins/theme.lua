return {
	{
		"deparr/tairiki.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tairiki").setup({
				default_dark = "tomorrow",
				diagnostics = {
					darker = false,
					background = false,
					undercurl = false,
				},
				code_style = {
					-- comments = { italic = true },
					-- keywords = { bold = true },
				},
				-- colors = function(c, opts)
				-- c.fg = "#FFFFFF"
				-- c.bg = "#000000"
				-- end,
			})
		end,
	},
	{
		"webhooked/kanso.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanso").setup({
				bold = true, -- enable bold fonts
				italics = true, -- enable italics
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = {},
				typeStyle = {},
				transparent = true, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = { -- add/modify theme and palette colors
					palette = {},
					theme = { zen = {}, pearl = {}, ink = {}, all = {} },
				},
				overrides = function(colors) -- add/modify highlights
					return {}
				end,
				background = { -- map the value of 'background' option to a theme
					dark = "ink", -- try "zen", "mist" or "pearl" !
					light = "pearl", -- try "zen", "mist" or "pearl" !
				},
				foreground = "saturated", -- "default" or "saturated" (can also be a table like background)
			})
		end,
	},
	{
		"vague-theme/vague.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other plugins
		config = function()
			-- NOTE: you do not need to call setup if you don't want to.
			require("vague").setup({
				-- optional configuration here
			})
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "auto", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = false, -- disables setting the background color.
				float = {
					transparent = false, -- enable transparent floating windows
					solid = false, -- use solid styling for floating windows, see |winborder|
				},
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = false, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.15, -- percentage of the shade to apply to the inactive window
				},
				no_italic = false, -- Force no italic
				no_bold = false, -- Force no bold
				no_underline = false, -- Force no underline
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- Change the style of comments
					conditionals = { "italic" },
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
					-- miscs = {}, -- Uncomment to turn off hard-coded styles
				},
				lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
						ok = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
						ok = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
				color_overrides = {
					mocha = {
						base = "#000000",
						mantle = "#000000",
					},
				},
				custom_highlights = {},
				default_integrations = true,
				auto_integrations = false,
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					notify = false,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
					-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
			})
		end,
	},
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup({
				background = "hard",
			})
		end,
	},
}
