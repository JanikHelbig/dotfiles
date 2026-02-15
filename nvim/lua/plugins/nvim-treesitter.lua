return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    opts = {
        folds = { enable = true },
        indent = { enable = true },
        highlight = { enable = true },
        ensure_installed = {
            'lua',
            'gdscript',
        },
    }
}
