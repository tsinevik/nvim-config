return {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    {
        "VonHeikemen/lsp-zero.nvim",
        lazy = false,
        branch = "v3.x",
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_lspconfig()
            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
                client.server_capabilities.semanticTokensProvider = nil
                lsp_zero.buffer_autoformat()
            end)

            local lspconfig = require("lspconfig")

            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = { "tsserver", "eslint", "lua_ls", "gopls", "angularls", "html", "rust_analyzer" },
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())
                    end,
                    tsserver = function()
                        lspconfig.tsserver.setup({
                            settings = {
                                implicitProjectConfiguration = {
                                    checkJs = true
                                },
                            }
                        })
                    end,
                    gopls = function()
                        lspconfig.gopls.setup({
                            settings = {
                                gopls = {
                                    completeUnimported = true,
                                    usePlaceholders = true,
                                    analyses = {
                                        unusedparams = true,
                                    },
                                    staticcheck = true,
                                    gofumpt = true,
                                },
                            },
                        })
                    end,
                },
            })
        end,
    },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/cmp-nvim-lsp" },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            local cmp_action = require("lsp-zero").cmp_action()

            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    -- `Enter` key to confirm completion
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    -- `Tab` key to confirm completion
                    ["<Tab>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),

                    -- Ctrl+Space to trigger completion menu
                    ["<C-Space>"] = cmp.mapping.complete(),

                    -- Navigate between snippet placeholder
                    ["<C-f>"] = cmp_action.luasnip_jump_forward(),
                    ["<C-b>"] = cmp_action.luasnip_jump_backward(),

                    -- Scroll up and down in the completion documentation
                    ["<C-u>"] = cmp.mapping.scroll_docs(-2),
                    ["<C-d>"] = cmp.mapping.scroll_docs(2),
                }),
            })
        end,
    },
    { "L3MON4D3/LuaSnip" },
}
