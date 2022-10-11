vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
vim.keymap.set("n", "<leader>fk", "<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>")
vim.keymap.set("n", "<leader>cc", "<cmd>Telescope ui-select<cr>")
vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>")
vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>")
vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>")
vim.keymap.set("n", "gtd", "<cmd>Telescope lsp_type_definitions<cr>")

require("telescope").setup {
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_cursor {
        }
      }
    }
}
require("telescope").load_extension("ui-select")
require("telescope").load_extension('projects')
