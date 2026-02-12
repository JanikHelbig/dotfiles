local is_windows = jit.os == 'Windows'

return {
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
        -- { '<leader>e',          function() Snacks.explorer() end,       desc = 'File Explorer' },
        -- Other
        { '<C-/>',              function() Snacks.terminal() end,       desc = 'Toggle Terminal' },
        { '<C-_>',              function() Snacks.terminal() end,       desc = 'which_key_ignore' },
    },
}
