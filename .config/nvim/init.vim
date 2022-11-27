" numbers
:set number
:set relativenumber

" text wrapping
:set nowrap

" indent
:set autoindent
:set tabstop=4
:set shiftwidth=0
:set expandtab

" source file of vim-plug
source $HOME/.config/nvim/vim-plug/plugins.vim

" colorcheme
colorscheme catppuccin

" Use tab to trigger autocompletion coc
noremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"


function! CheckBackspace() abort
	  let col = col('.') - 1
	    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" lua config
lua << EOF
require('nvim-treesitter.configs').setup {
	  ensure_installed = "c", "zig", "cpp", "ts",
	    highlight = { enable = true },
	      indent = { enable = true }
}
EOF

lua << EOF
require("nvim-autopairs").setup {}
EOF
