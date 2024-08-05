-- BASIC
vim.cmd [[
colo base16-gruvbox-dark-hard
se nocp ts=4 sw=4 noet nu rnu sc si ai hls is mouse=a tgc cc=80
se list lcs=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
]]

-- 42
vim.g.user42 = 'ecarvalh'
vim.g.mail42 = 'ecarvalh@student.42porto.com'

-- Keybinds
vim.cmd [[
let mapleader = ' '
au TermOpen * setlocal nonu nornu
tno <Esc> <C-\><C-n>
nn <leader>w <C-w>
nn <leader>t :term<CR>
]]

-- Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"IogaMaster/neocord",
	event = "VeryLazy",
	config = function()
		require("neocord").setup({
			logo = "auto",
			logo_tooltip = nil,
			main_image = "language",
			log_level = nil,
			debounce_timeout = 10,
			blacklist = {},
			file_assets = {},
			show_time = true,
			global_timer = true,

			editing_text = "Editando %s",
			file_explorer_text = "Navegando %s",
			git_commit_text = "Fazendo commit",
			plugin_manager_text = "Gerenciando plugins",
			reading_text = "Lendo %s",
			workspace_text = "Trabalhando em %s",
			line_number_text = "Linha %s de %s",
			terminal_text = "Usando terminal",
		})
	end
})
