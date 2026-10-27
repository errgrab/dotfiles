local opt = vim.opt

opt.tabstop = 4
opt.shiftwidth = 4
opt.number = true
opt.relativenumber = true
opt.colorcolumn = "80"
opt.clipboard = "unnamedplus"

opt.list = true
opt.listchars = {
	tab = "| ",
	extends = ">",
	precedes = "<",
	nbsp = ".",
	trail = ".",
}

vim.g.mapleader = " "

-- Lazy
--require("config.lazy")

-- Keybinds
--require("config.keybinds")

-- Old config:
--vim.cmd [[source $HOME/.config/nvim/old.vim]]
