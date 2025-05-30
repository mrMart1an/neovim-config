return {
    {
        "MaximilianLloyd/ascii.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
    },
    {
        "goolord/alpha-nvim",
        -- dependencies = { 'echasnovski/mini.icons' },
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local dashboard = require("alpha.themes.dashboard")
            dashboard.section.header.val = require("ascii").art.planets.planets.saturn

            dashboard.section.buttons.val = {
                dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
                dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
                dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
                dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
                dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua<CR>"),
                dashboard.button("q", "  Quit", ":qa<CR>"),
            }

            local function footer()
                return "Programs must be written for people to read, and only incidentally for machines to execute."
            end

            dashboard.section.footer.val = footer()

            dashboard.section.footer.opts.hl = "Type"
            dashboard.section.header.opts.hl = "Include"
            dashboard.section.buttons.opts.hl = "Keyword"

            dashboard.opts.opts.noautocmd = true

            require("alpha").setup(dashboard.opts)
        end,
    },
}
