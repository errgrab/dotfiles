-- Settings
vim.cmd [[
colo base16-gruvbox-dark-hard
se nocp ts=4 sw=4 noet nu rnu sc si ai hls is mouse=a cc=80 tgc
se list lcs=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
]]

-- 42
vim.g.user42 = 'ecarvalh'
vim.g.mail42 = 'ecarvalh@student.42porto.com'

-- Space key (emacs equivalent: hydra)
vim.g.mapleader = ' '
vim.cmd [[
au TermOpen * setlocal nonu nornu
tno <Esc> <C-\><C-n>
nn <leader>w <C-w>
nn <leader>t :term<CR>
]]

-- Package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--depth 1",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	"andweeb/presence.nvim",
	config = function()
		require("presence").setup({
			auto_update         = true,
			neovim_image_text   = "A True Text Editor",
			main_image          = "neovim",
			debounce_timeout    = 10,
			show_time           = true,
			editing_text        = "Editing %s",
			file_explorer_text  = "Browsing %s",
			git_commit_text     = "Committing changes",
			plugin_manager_text = "Managing plugins",
			reading_text        = "Reading %s",
			workspace_text      = "Working on %s",
			line_number_text    = "Line %s out of %s",
		})
	end
})
