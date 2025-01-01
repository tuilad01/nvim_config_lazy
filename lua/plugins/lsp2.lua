-- LSP servers and clients communicate which features they support through "capabilities".
--  By default, Neovim supports a subset of the LSP specification.
--  With blink.cmp, Neovim has *more* capabilities which are communicated to the LSP servers.
--  Explanation from TJ: https://youtu.be/m8C0Cq9Uv9o?t=1275
--
-- This can vary by config, but in general for nvim-lspconfig:

return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'saghen/blink.cmp',
        --        'hrsh7th/nvim-cmp',
        --        'hrsh7th/cmp-buffer',
        --        'hrsh7th/cmp-path',
        --        'hrsh7th/cmp-nvim-lsp',
        --        'hrsh7th/cmp-nvim-lua',
        --        'hrsh7th/cmp-cmdline',
        'ray-x/lsp_signature.nvim',
        'Hoffs/omnisharp-extended-lsp.nvim',
    },

    -- example using `opts` for defining servers
    opts = {
        servers = {
            lua_ls = {},
            omnisharp = {
                cmd = { "dotnet", "E:/Programs/Lsp/omnisharp-win-x64-net6.0/OmniSharp.dll" },
                settings = {
                    FormattingOptions = {
                        -- Enables support for reading code style, naming convention and analyzer
                        -- settings from .editorconfig.
                        EnableEditorConfigSupport = true,
                        -- Specifies whether 'using' directives should be grouped and sorted during
                        -- document formatting.
                        OrganizeImports = nil,
                    },
                    MsBuild = {
                        -- If true, MSBuild project system will only load projects for files that
                        -- were opened in the editor. This setting is useful for big C# codebases
                        -- and allows for faster initialization of code navigation features only
                        -- for projects that are relevant to code that is being edited. With this
                        -- setting enabled OmniSharp may load fewer projects and may thus display
                        -- incomplete reference lists for symbols.
                        LoadProjectsOnDemand = nil,
                    },
                    RoslynExtensionsOptions = {
                        -- Enables support for roslyn analyzers, code fixes and rulesets.
                        EnableAnalyzersSupport = nil,
                        -- Enables support for showing unimported types and unimported extension
                        -- methods in completion lists. When committed, the appropriate using
                        -- directive will be added at the top of the current file. This option can
                        -- have a negative impact on initial completion responsiveness,
                        -- particularly for the first few completion sessions after opening a
                        -- solution.
                        EnableImportCompletion = nil,
                        -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
                        -- true
                        AnalyzeOpenDocumentsOnly = nil,
                        EnableDecompilationSupport = true,
                    },
                    Sdk = {
                        -- Specifies whether to include preview versions of the .NET SDK when
                        -- determining which version to use for project loading.
                        IncludePrereleases = true,
                    },
                    handlers = {
                        ["textDocument/definition"] = require('omnisharp_extended').definition_handler,
                        ["textDocument/typeDefinition"] = require('omnisharp_extended').type_definition_handler,
                        ["textDocument/references"] = require('omnisharp_extended').references_handler,
                        ["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,
                    }

                }
            }
        }
    },
    config = function(_, opts)
        local lspconfig = require('lspconfig')
        for server, config in pairs(opts.servers) do
            -- passing config.capabilities to blink.cmp merges with the capabilities in your
            -- `opts[server].capabilities, if you've defined it
            config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)

            if server == 'omnisharp' then
                if config.server_capabilities ~= nil then
                    for capability, _ in pairs(config.server_capabilities) do
                        config.server_capabilities[capability] = false
                    end

                end
            end
            lspconfig[server].setup(config)
        end

        require('lsp_signature').setup({
            bind = true,
            floating_window = true,
            hint_enable = true,
            hint_prefix = "find",
            handler_opts = {
                border = "rounded",

            },
            always_trigger = true,
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


}
