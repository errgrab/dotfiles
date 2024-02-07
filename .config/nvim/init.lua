-- Settings
vim.opt.compatible = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.mouse = "a"

-- 42
vim.g.user42 = 'ecarvalh'
vim.g.mail42 = 'ecarvalh@student.42porto.com'

vim.opt.list = true
vim.opt.listchars = 'tab:» ,extends:›,precedes:‹,nbsp:·,trail:·'

vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', '<leader>w', '<C-w>', {})
vim.api.nvim_set_keymap('n', '<leader>t', ':term<CR>', {})

vim.cmd([[
au TermOpen * setlocal nonu nornu
]])
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {})
