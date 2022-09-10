require('mason').setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        'rust_analyzer',
        'tsserver',
        'sumneko_lua',
        'pyright',
        'gopls',
        'clangd',
        'eslint',
        'taplo',
        'yamlls'
    }
})

