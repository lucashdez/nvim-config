return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "rust",
                "cmake",
                "cpp",
                "c",
                "lua",
                "astro",
                "scss",
                "css",
                "sql",
                "norg",
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    { "vhyrro/luarocks.nvim", priority = 1000, config = true },
    {
        "nvim-neorg/neorg",
        -- tag = "*",
        dependencies = { "luarocks.nvim" },
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
                    --["core.tempus"] = {},
                    --["core.ui.calendar"] = {},
                    ["core.summary"] = {},
                    ["core.dirman"] = { -- Manages Neorg workspaces
                        config = {
                            workspaces = {
                                notes = notes_d,
                            },
                        },
                    },
                    ["core.integrations.treesitter"] = {},
                    ["core.integrations.nvim-cmp"] = {},
                },
            })
        end,
    },
}
