return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "rust",
                "cmake",
                "cpp",
                "c",
                "astro",
                "scss",
                "css",
                "sql",
                "norg",
                "norg_meta",
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        -- tag = "*",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local notes_d = "~/drive/El-Arca"
            if vim.fn.has("win32") then
                notes_d = "~/Mi unidad/El-Arca/Notes"
            end
            require("neorg").setup({
                load = {
                    ["core.defaults"] = {}, -- Loads default behaviour
                    ["core.concealer"] = {}, -- Adds pretty icons to your documents
                    ["core.ui"] = {},
                    ["core.tempus"] = {},
                    ["core.ui.calendar"] = {},
                    ["core.summary"] = {},
                    ["core.completion"] = {
                        config = {
                            engine = "nvim-cmp",
                        },
                    },
                    ["core.dirman"] = { -- Manages Neorg workspaces
                        config = {
                            workspaces = {
                                notes = notes_d,
                            },
                        },
                    },
                },
            })
        end,
    },
}
