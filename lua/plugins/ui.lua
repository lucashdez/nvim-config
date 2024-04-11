return {
    {
        "folke/noice.nvim",
        dependencies = {

            "MunifTanjim/nui.nvim",
        },
        opts = function(_, opts)
            table.insert(opts.routes, {
                filter = {
                    event = "notify",
                    find = "No information available",
                },
                opts = { skip = true },
            })
            table.insert(opts.routes, {
                filter = {
                    event = "notify",
                    find = "No signature help available",
                },
                opts = { skip = true },
            })
            opts.presets.lsp_doc_border = true
        end,
    },
    -- notifications
    {
        "rcarriga/nvim-notify",
        opts = {
            timeout = 1000,
            animate = true,
            stages = "slide",
        },
    },
    -- bufferline
    {

        "akinsho/bufferline.nvim",
        opts = {
            options = {
                mode = "tabs",
                show_buffer_close_icons = false,
                show_close_icon = false,
            },
        },
    },
    -- lualine
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {
            theme = "catppuccin",
        },
    },

    -- animations
    {
        "echasnovski/mini.animate",
        event = "VeryLazy",
        opts = function(_, opts)
            opts.scroll = {
                enable = false,
            }
        end,
    },

    -- logo
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        opts = function(_, opts)
            local logo = [[
██╗     ██╗  ██╗██████╗ ███████╗███████╗ █████╗ 
██║     ██║  ██║██╔══██╗██╔════╝╚══███╔╝██╔══██╗
██║     ███████║██║  ██║█████╗    ███╔╝ ███████║
██║     ██╔══██║██║  ██║██╔══╝   ███╔╝  ██╔══██║
███████╗██║  ██║██████╔╝███████╗███████╗██║  ██║
╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝
            ]]
            logo = string.rep("\n", 8) .. logo .. "\n\n"
            opts.config.header = vim.split(logo, "\n")
        end,
    },

    {
        "dhruvasagar/vim-table-mode",
        config = function()
            vim.g.table_mode_corner = "+"
            vim.g.table_mode_header_fillchar = "="
        end,
    },
    {
        "lucashdez/4coder-theme",
    },
    {
        "echasnovski/mini.hipatterns",
        event = "BufReadPre",
        opts = function()
            local hi = require("mini.hipatterns")
            return {
                highlighters = {
                    hsl_color = {
                        pattern = "hsl%(%d+,? %d+,? %d+%)",
                        group = function(_, match)
                            local utils = require("4coder-theme.hsl")
                            local nh, ns, nl = match:match("hsl%((%d+),? (%d+),? (%d+)%)")
                            local h, s, l = tonumber(nh), tonumber(ns), tonumber(nl)
                            --- @type string
                            local hex_color = utils.hslToHex(h, s, l)
                            return hi.compute_hex_color_group(hex_color, "bg")
                        end,
                    },
                    hex_color = hi.gen_highlighter.hex_color({ priority = 2000 }),
                },
            }
        end,
    },
    {
        "AlexvZyl/nordic.nvim",
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
    },
}
