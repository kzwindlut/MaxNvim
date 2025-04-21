return {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason-lspconfig",
    },

    config = function (_, opts)
        require("mason").setup(opts)
        local registry = require("mason-registry")

        local function setup(name, config)
            local success, package = pcall(registry.get_package, name)
            if success and not package:is_installed() then
                package:install()
            end
            local nvim_lsp = require("mason-lspconfig.mappings.server")
            config.capabilities = require("blink.cmp").get_lsp_capabilities()
            config.on_attach = function (client)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
                
            end
            require("lspconfig")[nvim_lsp.package_to_lspconfig[name]].setup(config)
        end

        local servers = {
            ["lua-language-server"] = {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        }
                    }
                }
            },
            ["kotlin-language-server"] = {},
            --["java-language-server"] = {},
            ["gradle-language-server"] = {},
            --["ktlint"] = {},
        }

        for server, config in pairs(servers) do
            setup(server, config)
        end

        vim.cmd("LspStart")
        vim.diagnostic.config({
            virtual_text = true,
            update_in_insert = true,
        })
    end
}
