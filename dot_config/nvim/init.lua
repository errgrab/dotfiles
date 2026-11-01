local opt = vim.opt

opt.tabstop = 4
opt.shiftwidth = 4
opt.number = true
opt.relativenumber = true
opt.colorcolumn = "80"
--opt.termguicolors = false
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
vim.g.maplocalleader = " "

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local hl_groups = { "Normal", "NormalFloat", "FloatBorder", "SignColumn", "LineNr" }
    for _, group in ipairs(hl_groups) do
      vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
    end
  end,
})

vim.cmd.colorscheme("quiet")

-- Lazy
require("config.lazy")

-- Keybinds
require("config.keybinds")

-- Old config:
--vim.cmd [[source $HOME/.config/nvim/old.vim]]
