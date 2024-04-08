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
vim.g.mapleader = ' '
vim.cmd [[
au TermOpen * setlocal nonu nornu
tno <Esc> <C-\><C-n>
nn <leader>w <C-w>
nn <leader>t :term<CR>
]]
