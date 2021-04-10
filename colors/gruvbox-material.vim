highlight clear

if exists("syntax_on")
  syntax reset
endif

set t_Co=256

"load colorscheme
lua require("gruvbox-material").setup()
