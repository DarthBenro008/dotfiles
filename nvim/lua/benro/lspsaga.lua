require("lspsaga").init_lsp_saga({
    finder_action_keys = {
        open = "o",
        vsplit = "s",
        split = "i",
        tabe = "t",
        quit = "<Esc>",
    },
    code_action_lightbulb = {
        enable = true,
        enable_in_insert = false,
        cache_code_action = true,
        sign = false,
    },
    rename_action_quit = "<Esc>",
})

vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })