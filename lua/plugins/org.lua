return {
 'nvim-orgmode/orgmode',
 event = 'VeryLazy',
 ft = { 'org' },
 config = function()
  require('orgmode').setup {
   org_agenda_files = 'C:/projects/EmacsInfo/**/*',
   org_default_notes_file = 'C:/projects/EmacsInfo/todo.org',
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
 end

}
