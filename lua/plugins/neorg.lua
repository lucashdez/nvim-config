return {
  {
    'vhyrro/luarocks.nvim',
    priority = 1000, -- We'd like this plugin to load first out of the rest
    config = true, -- This automatically runs `require("luarocks-nvim").setup()`
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-neotest/nvim-nio',
      'nvim-neorg/lua-utils.nvim',
      'nvim-lua/plenary.nvim',
      'pysan3/pathlib.nvim',
    },
  },
  {
    'nvim-neorg/neorg',
    lazy = false,
    version = '*',
    dependencies = { 'luarocks.nvim' },
    config = function()
      local path_notes = '~/drive/El-Arca/neorg-notes'
      if vim.fn.has('win32') == 1 then
        path_notes = 'G:/My Drive/El-Arca/neorg-notes'
      end

      require('neorg').setup {
        load = {
          ['core.defaults'] = {},
          ['core.concealer'] = {},
          ['core.completion'] = {
            config = {
              engine = 'nvim-cmp',
            },
          },
          ['core.ui.calendar'] = {},
          ['core.itero'] = {},
          ['core.dirman'] = {
            config = {
              workspaces = {
                notes = path_notes,
              },
              default_workspace = 'notes',
            },
          },
        },
      }
      vim.keymap.set('n', '<Space>l', '<Plug>(neorg.qol.todo-items.todo.task-cycle)', {})
    end, --]],
  },
}
