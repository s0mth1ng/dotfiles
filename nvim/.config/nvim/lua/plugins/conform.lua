return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			local enable_filetypes = { go = true, lua = true, sql = true }
			if enable_filetypes[vim.bo[bufnr].filetype] then
				return {
					timeout_ms = 500,
					lsp_format = "fallback",
				}
			else
				return nil
			end
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			sql = { "pg_format" },
			-- go = { "gofmt", "gofumpt", "gci", "golines" },
			go = { "golangci-lint" },
			-- python = { "black" },
		},
	},
}
