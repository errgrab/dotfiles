return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {
		format_on_save = {
			timeout_ms = 3000,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			python = { "ruff_fix", "ruff_format" },
			lua = { "stylua" },
		},
	},
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format()
			end,
			desc = "Format",
		},
	},
}
