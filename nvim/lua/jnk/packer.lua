return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- Packer can manage itself

    use 'numToStr/Comment.nvim'
    
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
    use {
        'nvim-telescope/telescope-file-browser.nvim',
        requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' }
    }

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
		
    use 'neovim/nvim-lspconfig'

    use { 'williamboman/mason.nvim', run = ':MasonUpdate' }	
    use 'williamboman/mason-lspconfig.nvim'

    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'

    use { 'akinsho/toggleterm.nvim', tag = '*' }

    use {
        'vimwiki/vimwiki',
        setup = function()
            vim.g.vimwiki_list = {{ path = '~/vimwiki/', syntax = 'markdown', ext = '.md' }}
            vim.g.vimwiki_ext2syntax = { ['.md'] = 'markdown', ['.markdown'] = 'markdown', ['.mdown'] = 'markdown' }
            vim.g.vimwiki_global_ext = 0
        end
    }
	
    use { "catppuccin/nvim", as = "catppuccin" }
end)
