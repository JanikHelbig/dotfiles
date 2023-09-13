vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, { noremap = true })

vim.keymap.set('n', '<leader>t', function()
    vim.cmd('below split')
    vim.cmd.resize(math.floor(vim.fn.winheight(0) / 2.0))
    vim.cmd.terminal()
    vim.cmd('startinsert')
    end,
    { noremap = true }
)

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
    end,
})

