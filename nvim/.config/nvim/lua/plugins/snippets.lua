return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
	config = function()
		ls = require("luasnip")
		snippets = require("config.snippets")
		ls.add_snippets("go", snippets.go)

		vim.api.nvim_create_autocmd("ModeChanged", {
			pattern = "*",
			callback = function()
				if
					((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
					and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
					and not require("luasnip").session.jump_active
				then
					require("luasnip").unlink_current()
				end
			end,
		})
	end,
}
