local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")
require("trouble").setup {
    signs = {
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
    },
}
telescope.setup {
    defaults = {
        mappings = {
            i = { ["<leader>t"] = trouble.open_with_trouble },
            n = { ["<leader>t"] = trouble.open_with_trouble },
        },
    },
}

