return {
  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
      -- Setup orgmode
      require('orgmode').setup {
        org_agenda_files = '~/drive/El-Arca/ORG/**/*',
        org_default_notes_file = '~/drive/El-Arca/ORG/template.org',
      }
    end,
  },
  {
    'lukas-reineke/headlines.nvim',
    dependencies = { 'nvim-orgmode/orgmode' },
    config = function()
      vim.cmd [[highlight Headline1 guibg=#1e2718]]
      vim.cmd [[highlight Headline2 guibg=#21262d]]
      vim.cmd [[highlight CodeBlock guibg=#1c1c1c]]
      vim.cmd [[highlight Dash guibg=#D19A66 gui=bold]]

      require('headlines').setup {
        org = {
          headline_highlights = { 'Headline1', 'Headline2' },
          fat_headlines = false,
        },
      }
    end,
  },
}




