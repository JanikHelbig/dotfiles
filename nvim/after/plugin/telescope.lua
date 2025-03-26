local telescope = require('telescope')

telescope.setup({
    defaults = {
        borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
        layout_strategy = 'horizontal',
        layout_config = {
            horizontal = {
                prompt_poition = 'top',
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,  
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
            prompt_position = "top",
        },
        sorting_strategy = 'ascending',
        file_ignore_patterns = { '%.meta' },
    },
    pickers = {
        find_files = {
            -- theme = 'ivy'
        },
        live_grep = {
            -- theme = 'ivy'
        }
    },
    extensions = {
        file_browser = {
            disable_devicons = true,
            display_stat = { date = false, size = true, mode = false },
            hijack_netrw = false,
        }
    }
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fp', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fr', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fw', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fq', builtin.quickfix, {})
vim.keymap.set('n', '<leader>fh', builtin.search_history, {})
vim.keymap.set('n', '<leader>fs', builtin.lsp_workspace_symbols, {})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

telescope.load_extension('file_browser')
vim.keymap.set('n', '<leader>pf', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { noremap = true })
-- vim.keymap.set('n', '<leader>fb', telescope.extensions.file_browser.file_browser, { path='%:p:h', select_buffer = true, noremap = true })
