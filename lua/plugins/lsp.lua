local M = {
    'williamboman/mason.nvim',
    dependencies = {
        'neovim/nvim-lspconfig',
        'williamboman/mason-lspconfig.nvim',
        'nvim-lua/plenary.nvim',
        'Hoffs/omnisharp-extended-lsp.nvim',
        'hrsh7th/cmp-nvim-lsp',
        -- Snippets
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets',
    },
}

--M.servers = {
--	"lua_ls",
--	"rust_analyzer",
--	"clangd"
--}

function M.config()
    require("mason").setup()
    require("mason-lspconfig").setup {
        --            ensure_installed = M.servers,
        automatic_installation = false,
        handlers = {
            function (server_name)

                local capabilities = require('cmp_nvim_lsp').default_capabilities()

                if server_name == "omnisharp" then
                    require("lspconfig").omnisharp.setup({
                        capabilities = capabilities,
                        handlers = {
                            ["textDocument/definition"] = require('omnisharp_extended').definition_handler,
                            ["textDocument/typeDefinition"] = require('omnisharp_extended').type_definition_handler,
                            ["textDocument/references"] = require('omnisharp_extended').references_handler,
                            ["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,

                        },
                        RoslynExtensionsOptions= {
                            EnableDecompilationSupport = true
                        }

                    })
                else
                    require "lspconfig" [server_name].setup {
                        capabilities = capabilities
                    }
                end
            end
        }
    }

    vim.diagnostic.config({
        virtual_text = true
    })

    vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
            local opts = {buffer = event.buf}

            vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
            vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
            vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
            vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
            vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
            vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
            vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
            vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
            vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
            vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        end,
    })
end

return M
