return {
  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
      -- Setup orgmode
      require('orgmode').setup {
        org_agenda_files = '~/projects/ORG/**/*',
        org_default_notes_file = '~/projects/ORG/template.org',
      }
    end,
  },
}
