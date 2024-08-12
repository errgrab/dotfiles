call plug#begin()
Plug 'chriskempson/base16-vim'
call plug#end()
let base16colorspace=256
colo base16-gruvbox-dark-hard
"hi Normal guibg=#000000 ctermbg=16
se ts=4 sw=4 noet nu rnu sc si ai hls is mouse=a tgc
se list lcs=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
let g:mapleader="\<space>"
nn <leader>w <C-w>
nn <leader>t :term<CR>
au TermOpen * setlocal nonu nornu
tno <Esc> <C-\><C-n>