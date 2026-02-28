vim.cmd.colorscheme("retrobox")

vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#333333" })

local opt = vim.opt

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false

opt.number = true
opt.relativenumber = true
opt.showcmd = true
opt.smartindent = true
opt.autoindent = true
opt.termguicolors = true
opt.colorcolumn = "80"

opt.list = true
opt.listchars = {
	tab = "| ",
	extends = ">",
	precedes = "<",
	nbsp = ".",
	trail = ".",
}

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.user42 = "ecarvalh"
vim.g.mail42 = "ecarvalh@student.42porto.com"

vim.keymap.set("n", "<leader>w", "<C-w>", { desc = "Window commands" })
vim.keymap.set("n", "<leader>t", "<cmd>term<CR>", { desc = "Open terminal" })

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
	end,
})

-- Old config:
--vim.cmd [[source $HOME/.config/nvim/old.vim]]
