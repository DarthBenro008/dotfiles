-- setup lsp completions
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>fr', vim.lsp.buf.format, bufopts)

    if client.name == "tsserver" then
        client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
    end
    if client.name == "eslint" then
        client.server_capabilities.documentFormattingProvider = true -- 0.8 and later
    end
end

local lsp_flags = {
    debounce_text_changes = 150,
}

local lspconfig = require('lspconfig')

local servers = { 'rust_analyzer', 'eslint', 'tsserver', 'sumneko_lua', 'pyright', 'gopls', 'clangd', 'taplo', 'yamlls' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = lsp_flags,
    }
end




-- lsp signature
cfg = {} -- add you config here
require "lsp_signature".setup(cfg)

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}

-- notify integration
vim.api.nvim_create_autocmd({ 'UIEnter' }, {
    once = true,
    callback = function()
        local Spinner = require('benro.spinner')
        local spinners = {}

        local function format_msg(msg, percentage)
            msg = msg or ''
            if not percentage then
                return msg
            end
            return string.format('%2d%%\t%s', percentage, msg)
        end

        vim.api.nvim_create_autocmd({ 'User' }, {
            pattern = { 'LspProgressUpdate' },
            group = vim.api.nvim_create_augroup('LSPNotify', { clear = true }),
            desc = 'LSP progress notifications',
            callback = function()
                for _, c in ipairs(vim.lsp.get_active_clients()) do
                    for token, ctx in pairs(c.messages.progress) do
                        if not spinners[c.id] then
                            spinners[c.id] = {}
                        end
                        local s = spinners[c.id][token]
                        if not ctx.done then
                            if not s then
                                spinners[c.id][token] = Spinner(
                                    format_msg(ctx.message, ctx.percentage), vim.log.levels.INFO, {
                                    title = ctx.title and string.format('%s: %s', c.name, ctx.title) or c.name
                                })
                            else
                                s:update(format_msg(ctx.message, ctx.percentage))
                            end
                        else
                            c.messages.progress[token] = nil
                            if s then
                                s:done(ctx.message or 'Complete', nil, {
                                    icon = '',
                                })
                                spinners[c.id][token] = nil
                            end
                        end
                    end
                end
            end,
        })
    end,
})

local severity = {
    "error",
    "warn",
    "info",
    "info", -- map both hint and info to info?
}
vim.lsp.handlers["window/showMessage"] = function(err, method, params, client_id)
    vim.notify(method.message, severity[params.type])
end

-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        vim.lsp.buf.format()
    end,
})
