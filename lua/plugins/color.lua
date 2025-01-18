local configs = {
    colorscheme_transparent_background = true
}


return {
    --"askfiy/visual_studio_code",
    "catppuccin/nvim",
    name = "catppuccin-mocha",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    --transparent = true,
    
    config = function()
        require('catppuccin').setup({
            transparent_background = configs.colorscheme_transparent_background
        })
        vim.g.nord_disable_background = true
        vim.cmd([[colorscheme catppuccin-mocha]])

        vim.api.nvim_create_user_command('ToggleBackground', function ()
            configs.colorscheme_transparent_background = not configs.colorscheme_transparent_background

            require('catppuccin').setup({
                transparent_background = configs.colorscheme_transparent_background
            })

            vim.cmd([[colorscheme catppuccin-mocha]])
        end, {})
    end


}

