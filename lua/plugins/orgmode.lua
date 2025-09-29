return {
 {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
   -- Setup orgmode
   local notes = 'C:/projects/EmacsInfo/notes.org'
   local agenda = 'C:/projects/EmacsInfo/**/*'
   require('orgmode').setup {
    org_agenda_files = agenda,
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
