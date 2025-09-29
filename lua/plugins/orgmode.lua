return {
 {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
   -- Setup orgmode
   local notes = '/home/seriuusly/drive/El-Arca/ORG/template.org'
   local agenda = 'home/seriuusly/drive/El-Arca/ORG/**/*'
   if vim.fn.has("win32") then
    notes = 'C:/projects/EmacsInfo/notes.org'
    agenda = 'C:/projects/EmacsInfo/**/*'
   end

   notes = '/home/seriuusly/drive/El-Arca/ORG/template.org'
   agenda = 'home/seriuusly/drive/El-Arca/ORG/**/*'

   require('orgmode').setup {
    org_agenda_files = '~/drive/El-Arca/ORG/**/*',
    org_default_notes_file = notes,
    org_todo_keywords = { 'BACKLOG', 'TODO', 'PROGRESS', '|', 'DONE', 'REVIEWED' },
    org_todo_keyword_faces = {
     BACKLOG  = ':background #444444 :foreground #FFFFFF',
     TODO     = ':background red :foreground #FFFFFF',
     PROGRESS = ':background #ffcc00 :foreground #FFFFFF',
     DONE     = ':background green :foreground #FFFFFF',
     REVIEWED = ':background blue :foreground #FFFFFF',
    },
    org_log_done = 'note'
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
