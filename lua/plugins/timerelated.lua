return {
    {
        "itchyny/calendar.vim",
        config = function()
            vim.g.calendar_google_calendar = 1
            vim.g.calendar_google_task = 1
            local path = "source ~/.cache/calendar.vim/credentials.vim"
            vim.cmd(path)
        end,
    },
    {
        "lucashdez/CalendarNvim",
    },
    {
        "lucashdez/TaskTracker",
        config = function()
            local tt = require("TaskTracker").setup({})
        end,
    },
}
