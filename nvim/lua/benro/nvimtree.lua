vim.keymap.set("n", "<leader>io", "<cmd>NvimTreeFindFileToggle<cr>")

require("nvim-tree").setup({
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = true
    },
    diagnostics = {
        enable = true
    }
})
