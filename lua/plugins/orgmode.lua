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
}
