vim.keymap.set('n', '<leader>tt', function ()
    vim.cmd.lua('print("hello")')   
end, {})

return {}
