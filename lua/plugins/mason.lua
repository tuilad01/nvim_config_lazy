local M = {
    'williamboman/mason.nvim',
    event = "BufAdd",
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'nvim-lua/plenary.nvim',
        'Hoffs/omnisharp-extended-lsp.nvim',
        'hrsh7th/cmp-nvim-lsp',
    },
}

--M.servers = {
    --	"lua_ls",
    --	"rust_analyzer",
    --	"clangd"
    --}

    function M.config()
        require("mason").setup()

        require "mason-lspconfig".setup_handlers {
            function (server_name)

                local capabilities = require('cmp_nvim_lsp').default_capabilities()

                require "lspconfig" [server_name].setup {
                    capabilities = capabilities
                }
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
                end
            end
        }

        require("mason-lspconfig").setup {
            --            ensure_installed = M.servers,
            automatic_installation = true,
        }

        vim.diagnostic.config({
            virtual_text = true
        })

    end

    return M
