return {
    {
        "folke/noice.nvim",
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
            timeout = 500,
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
}
