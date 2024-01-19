return {
  "williamboman/mason.nvim",
  lazy = false,
  dependencies = {
    "williamboman/mason-lspconfig.nvim"
  },

  config = function()
    require("mason").setup()

    local lspconfig = require('lspconfig')
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

    require('mason-lspconfig').setup({
      ensure_installed = {
        'tsserver',
        'html',
        'cssls',
        'rust_analyzer',
        'pylsp'
      },
      handlers = {
        function(server)
          lspconfig[server].setup{
            capabilities = lsp_capabilities,
          }
        end,
        ['tsserver'] = function()
          lspconfig.tsserver.setup{
            capabilities = lsp_capabilities,
            settings = {
              completions = {
                completeFunctionCalls = true
              }
            }
          }
        end
      }
    })
  end
}
