return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require('lualine').setup({
            sections = {
                lualine_x = {
                    'encoding',
                    function ()
                        local cwd = vim.fn.getcwd()
                        local workingDirectory = cwd:match("([^/\\]+)$")
                        return workingDirectory
                    end,
                    'filetype'
                }
            }
        })
    end
}
