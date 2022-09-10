require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "rust", "typescript", "python", "go", "yaml", "bash", "cpp", "dockerfile",
        "gitignore", "gomod", "javascript", "json" },
    auto_install = true,
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    highlight = {
        enable = true,
    },
    additional_vim_regex_highlighting = false,
    indent = {
        enable = true
    }
}

