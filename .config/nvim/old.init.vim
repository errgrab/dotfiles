colorscheme retrobox

set ts=4 sw=4 mouse=a " mouse and tab size
set noet si " tabs instead of spaces
set nu rnu " numbers
set hls is " better search
set list lcs=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

autocmd TermOpen * setlocal nonumber norelativenumber
tnoremap <Esc> <C-\><C-n>

let g:mapleader="\<Space>"
nnoremap <leader>w <C-w>
nnoremap <leader>t :term<CR>
