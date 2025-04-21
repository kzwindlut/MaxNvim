return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    config = function ()
        local registry = require("mason-registry")
        local function install(name)
            local success, package = pcall(registry.get_package, name)
            if success and not package:is_installed() then
                package:install()
            end
        end
        install("stylua")
        install("ktlint")
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.diagnostics.ktlint,
            }
        })
    end,
    keys = {
        {"<leader>lf", vim.lsp.buf.format},
    }
}
