vim.g.mapleader = ' '

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.scrolloff = 8

if jit.os == 'Windows' then
    vim.o.shell = 'pwsh'
    vim.o.shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command'
end
