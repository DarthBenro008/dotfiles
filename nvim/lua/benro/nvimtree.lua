vim.keymap.set("n", "io", "<cmd>NvimTreeToggle<cr>")
vim.keymap.set("n", "<leader>io", "<cmd>NvimTreeFindFileToggle<cr>")

require("nvim-tree").setup {
    hijack_netrw = true,
    disable_netrw = true,
    open_on_setup = true,
}
