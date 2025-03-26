require('mason').setup({
    ui = {
        border = 'rounded'
    }
})

require('mason-lspconfig').setup()

local cmp = require('cmp')

cmp.setup({
    experimental = {
        ghost_text = true,
    },
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    -- }, {
        { name = 'buffer' },
    })
})

local lspconfig = require('lspconfig')
-- local mason_lspconfig = require('mason-lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.omnisharp_mono.setup {}

require('mason-lspconfig').setup_handlers({
    function(server_name)
        if server_name == 'omnisharp_mono' then
            -- return
        end
        lspconfig[server_name].setup({
            capabilities = lsp_capabilities
        })
    end,
})

vim.diagnostic.config({ virtual_text = true })
