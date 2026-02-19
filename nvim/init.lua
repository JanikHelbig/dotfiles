--- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
      "git", "clone", "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

local is_windows = jit.os == 'Windows'

--- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

--- Options
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.scrolloff = 8

if is_windows then
    vim.o.shell = 'pwsh'
    vim.o.shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command'
end

--- Plugins
require("lazy").setup({
    spec = {
        {
            "neovim/nvim-lspconfig"
        },
        {
            "mason-org/mason.nvim",
            opts = {},
        },
        {
            "mason-org/mason-lspconfig.nvim",
            dependencies = {
                "mason-org/mason.nvim",
                "neovim/nvim-lspconfig",
            },
            opts = {
                ensure_installed = {
                    "lua_ls",
                },
            },
        },
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            opts = {
                ensure_installed = { "lua", "vimdoc", "markdown" },
                highlight = { enable = true },
            },
        },
        {
            'saghen/blink.cmp',
            version = '1.*',
            opts = {
                keymap = {
                    preset = 'default'
                },
                sources = {
                    default = { "lazydev", 'lsp', 'path', 'snippets', 'buffer' },
                    providers = {
                        lazydev = {
                            name = "LazyDev",
                            module = "lazydev.integrations.blink",
                            score_offset = 100,
                        },
                    },
                },
            },
            opts_extend = { 'sources.default' },
        },
        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
        {
            'folke/which-key.nvim',
            event = 'VeryLazy',
            opts = {
                preset = 'modern',
            },
            keys = {
                {
                    '<leader>?',
                    function()
                        require('which-key').show({ global = false })
                    end,
                    desc = 'Buffer Local Keymaps (which-key)',
                }
            }
        },
        {
            'folke/snacks.nvim',
            priority = 1000,
            lazy = false,
            opts = {
                -- explorer = { enabled = true },
                picker = { enabled = true },
                terminal = {
                    enabled = true,
                    shell = is_windows and { 'pwsh', '-NoLogo' } or vim.o.shell,
                },
            },
            keys = {
                { '<leader><space>',    function() Snacks.picker.smart() end,   desc = 'Smart Find Files' },
                { '<leader>e',          function() Snacks.explorer() end,       desc = 'File Explorer' },
                -- Other
                { '<C-/>',              function() Snacks.terminal() end,       desc = 'Toggle Terminal' },
                { '<C-_>',              function() Snacks.terminal() end,       desc = 'which_key_ignore' },
            },
        },
        {
            'catppuccin/nvim',
            name = 'catppuccin',
            lazy = false,
            priority = 1000,
            opts = {
                flavour = 'mocha',
                auto_integrations = true,
            },
        },
    },
    install = { colorscheme = { "catppuccin" } },
    checker = { enabled = true },
})

vim.cmd.colorscheme 'catppuccin'

-- Godot LSP connection
local root = vim.fs.root(0, 'project.godot')
if root then
    local pipe = is_windows and '\\\\.\\pipe\\godot-server' or root .. '/server.pipe'
    if not vim.tbl_contains(vim.fn.serverlist(), pipe) then
        vim.fn.serverstart(pipe)
    end
end

vim.lsp.enable('gdscript')
