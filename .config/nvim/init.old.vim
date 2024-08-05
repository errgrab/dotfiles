syntax on
filetype on

colo base16-gruvbox-dark-hard
"hi Normal guibg=#000000 ctermbg=16

" Settings
se nocp				" no compatible
se ts=4 sw=4 noet	" tabulation
se nu rnu sc		" numbers
se si ai			" indentation
se hls is			" search
se mouse=a			" mouse
se termguicolors	" term colors
se cc=80			" limit

" display
se list lcs=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

" Keybindings
let g:mapleader="\<space>"

nn <leader>w <C-w>
nn <leader>t :term<CR>

" Terminal integration
au TermOpen * setlocal nonu nornu
tno <Esc> <C-\><C-n>
