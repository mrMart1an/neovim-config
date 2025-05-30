return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            vim.opt.termguicolors = true
            require('toggleterm').setup {
                open_mapping = [[<c-\>]],
                float_opts = {
                    -- The border key is *almost* the same as 'nvim_win_open'
                    -- see :h nvim_win_open for details on borders however
                    -- the 'curved' border is a custom border type
                    -- not natively supported but implemented in this plugin.
                    -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
                    border = "curved",
                    -- width = <value>,
                    -- height = <value>,
                    winblend = 0,
                    highlights = {
                        border = "Normal",
                        background = "Normal",
                    },
                },
                auto_scroll = true, -- automatically scroll to the bottom on terminal output
                direction = "float",
                shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
                insert_mappings = true, -- whether or not the open mapping applies in insert mode
            }
        end,
    }
}
