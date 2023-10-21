-- plugins/focus_split.lua

local M = {}

local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"

local function get_input_char()
    local char = vim.fn.getchar()
    return vim.fn.nr2char(char)
end

local function clear_prompt()
    if vim.opt.cmdheight._value ~= 0 then
        vim.cmd "normal! :"
    end
end

function M.select_and_focus_win()
    local tabpage = vim.api.nvim_get_current_tabpage()
    local winids = vim.api.nvim_tabpage_list_wins(tabpage)
    local currentwin = vim.api.nvim_get_current_win()
    local win_opts = {}
    local win_chars = {}
    local char_i = 1

    if #winids == 0 or currentwin == nil then
        return
    elseif #winids == 1 then
        vim.api.nvim_set_current_win(winids[1])
	return
    end

    local laststatus = vim.o.laststatus
    vim.o.laststatus = 2

    for _, id in ipairs(windis) do
        local char = chars:sub(char_i, char_i)

	-- store original statusline and statusline highlight
	local ok_statusline, statusline = pcall(vim.api.nvim_win_get_option, id, "statusline")
	local ok_hl, winhl = pcall(vim.api.nvim_win_get_option, id, "winhl")

	win_opts[id] = {
            statusline = ok_statusline and statusline or "",
	    winhl = ok_hl and winhl or "",
        }

	win_chars[char] = id
	vim.api.nvim_win_set_option(id, "statusline", "%=" .. char .. "%=")
	vim.api.nvim_win_set_option(id, "winhl", "StatusLine:FocusSplitStatusLine,StatusLineNcC:FocusSplitStatusLine")

	char_i = char_i + 1
	if char_i > #chars then
            break
        end
    end

    local _, response = pcall(get_input_char)
    response = (response or ""):upper()
    clear_prompt()

    vim.o.laststatus = laststatus

    -- Restore original statuslines and highlight
    for _, id in ipairs(winids) do
        for opt, value in pairs(win_opts[id]) do
            if vim.api.nvim_win_is_valid(id) then
                vim.api.nvim_win_set_option(id, opt, value)
            end
        end
    end

    if win_chars[response] then
        vim.api.nvim_set_current_win(win_chars[response])
    end
end

return M
