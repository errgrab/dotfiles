return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.enable("clangd")

		vim.keymap.set("n", "gd", vim.lsp.buf.definition)
		vim.keymap.set("n", "gr", vim.lsp.buf.references)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
	end,
}
