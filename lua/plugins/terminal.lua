

local state = {
    floading = {
        buf = -1,
        win = -1,
    }
}


local function create_floating_window(opts)
    opts = opts or {}
    local width = opts.width or math.floor(vim.o.columns * 0.8)
    local height = opts.height or math.floor(vim.o.lines * 0.8)

    -- calculate the position to center the window
    local col = math.floor((vim.o.columns - width)  / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
    end

    local win_config = {
        relative = "editor",
        width = width,
        height = height,
        col = col,
        row = row,
        style = "minimal",
        border = "rounded",
    }

    local win = vim.api.nvim_open_win(buf, true, win_config)

    return { buf = buf, win = win }

end
local toggle_terminal = function ()
    if not vim.api.nvim_win_is_valid(state.floading.win) then
        state.floading = create_floating_window({
            buf = state.floading.buf
        })
        if vim.bo[state.floading.buf].buftype ~= "terminal" then
            vim.cmd.terminal()
        end
    else
        vim.api.nvim_win_hide(state.floading.win)
    end
    --print(vim.inspect(state.floading))

end
vim.api.nvim_create_user_command('Termf', function ()
    toggle_terminal()
end, {})
vim.keymap.set({"n", "t"}, "<leader>tt", toggle_terminal, {})
vim.keymap.set("t", "<esc>", "<C-\\><C-n>")
--vim.api.nvim_create_autocmd('ExitPre', {
--    desc = 'toggle before exiting neovim',
--    callback = function(event)
--        if vim.api.nvim_win_is_valid(state.floading.win) then
--            toggle_terminal()
--        end
--    end
--})
return {}
