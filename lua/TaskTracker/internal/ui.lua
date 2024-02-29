local utils = require("TaskTracker.internal.utils")
--- @module 'Window'
local M = {}

--- @class Window
--- @field id number window id
--- @field buf number buffer id
--- @field closing boolean window is closing
local Window = {}
Window.id = nil
Window.buf = nil
Window.closing = false

--- @param win_opts object
local function create_window(win_opts)
	if Window.id or Window.buf then
		print("window already exists")
	else
		Window.buf = vim.api.nvim_create_buf(false, true)
		Window.id = vim.api.nvim_open_win(Window.buf, false, win_opts)
	end
end

function Window.create_timer_window()
	local ui = vim.api.nvim_list_uis()[1]
	local col = 12
	if ui ~= nil then
		col = math.max(ui.width - 13, 0)
	end
	local options = {
		relative = "editor",
		width = 40,
		height = 1,
		row = 0,
		col = col,
		border = "none",
		style = "minimal",
	}
	create_window(options)
end

--- @param timer Timer
function Window.write_timer(timer)
	local instant = timer.get_instant()
	local fullname = utils.fit_string(timer.name, 40 - #instant)
	vim.api.nvim_buf_set_lines(Window.buf, 0, -1, false, { fullname .. instant })
end

--- @return Window window returns an instance of a Window
function M.new_window()
	return Window
end

return M
