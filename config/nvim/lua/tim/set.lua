vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.wrap = false

vim.opt.swapfile = false

vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.expandtab = true
vim.opt.updatetime = 50

vim.opt.undofile = true

vim.g.mapleader = " "

-- vim.cmd("set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:·")
vim.cmd("set listchars=trail:~,space:·")
vim.cmd("set list")

vim.cmd("inoremap <C-c> <Esc>")
