vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.cmdheight = 1
vim.opt.scrolloff = 8
vim.opt.expandtab = true
vim.opt.incsearch = true
vim.opt.autochdir = true
vim.opt.termguicolors = true
vim.opt.hidden = true
vim.opt.nu = true
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.errorbells = false
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.hlsearch = false
-- Leader
vim.g.mapleader = " "

-- Window Navigation

vim.keymap.set("n", "<leader>h", "<C-w>h<cr>")
vim.keymap.set("n", "<leader>j", "<C-w>j<cr>")
vim.keymap.set("n", "<leader>k", "<C-w>k<cr>")
vim.keymap.set("n", "<leader>l", "<C-w>l<cr>")
vim.keymap.set("n", "<leader><TAB>", "<cmd> bn <cr>")
vim.keymap.set("n", "<leader>qq", "<cmd>close<cr>")

-- Themes
-- Catpuccin
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
require("catppuccin").setup(
    {
        integrations = {
            notify = true,
            treesitter = true,
            telescope = true,
            lsp_saga = true,
            cmp = true,
            gitsigns = true,
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = { "italic" },
                    hints = { "italic" },
                    warnings = { "italic" },
                    information = { "italic" },
                },
                underlines = {
                    errors = { "underline" },
                    hints = { "underline" },
                    warnings = { "underline" },
                    information = { "underline" },
                },
            },
        }
    }
)
vim.cmd [[colorscheme catppuccin]]
-- Ayu
-- vim.cmd [[
--     let ayucolor="mirage"
--     colorscheme ayu
-- ]]

