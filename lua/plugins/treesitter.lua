return {
    { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        branch = "main",
        build = ':TSUpdate',
        main = 'nvim-treesitter.configs', -- Sets main module to use for opts
        -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
        --
        config = function()
            -- Initialize the plugin
            require("nvim-treesitter").setup()

            -- Parser to install
            local parsers = {
                'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'rust',
                'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc'
            }

            -- Tell treesitter to install them
            require("nvim-treesitter").install(parsers)

            -- Enable highlighting natively
            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("TreesitterHighlight", { clear = true }),
                callback = function(args)
                    -- pcall prevents crashes if a filetype lacks a parser
                    pcall(vim.treesitter.start, args.buf)
                end,
            })
        end,
    },
}
