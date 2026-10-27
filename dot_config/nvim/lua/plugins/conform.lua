return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {
		formatters_by_ft = {
			c = { "c_formatter_42" },
			lua = { "stylua" },
		},
		format_on_save = { timeout_ms = 3000, lsp_format = "fallback" },
	},
}
