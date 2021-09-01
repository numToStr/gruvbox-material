local palette = require('gruvbox-material.palette')
local defs = require('gruvbox-material.definitions')
local utils = require('gruvbox-material.utils')

local gruvbox = {}

function gruvbox:new()
    local state = {
        config = {
            background = 'hard', -- 'hard' | 'medium' | 'soft'
            palette = 'material', -- 'material' | 'mix' | 'original'
            transparent_bg = false,
            italic = false,
            italic_comment = false,
            bold = false,
            -- LSP
            diagnostic_text_highlight = false,
            diagnostic_line_highlight = false,
            -- {'treesitter', 'coc', 'vim-lsp', 'ycm', 'ale', 'telescope', 'git-gutter', 'easymotion', 'vim-sneak','vim-plug', 'nerdtree', 'vim-startify', 'hop.nvim', 'nvim-tree', 'gitsigns'}
            plugins = {},
        },
    }

    self.__index = self
    return setmetatable(state, self)
end

function gruvbox:setup(cfg)
    if cfg ~= nil then
        self.config = vim.tbl_extend('keep', cfg, self.config)
    end

    if cfg.plugins ~= nil then
        -- Converting plugins list to a table for better lookup
        local plugins = {}
        for _, v in ipairs(cfg.plugins) do
            plugins[v] = true
        end

        self.config.plugins = plugins
    end
end

function gruvbox:load()
    local config = self.config
    local colors = palette.get_palette(config.background, config.palette)

    -- Color namespace
    -- local ns = set_namespace("gruvbox-material")

    local plugin_his = defs.plugins(config, colors)
    local filetype_his = defs.filetypes(config, colors)
    local edtior = defs.editor(config, colors)

    utils.highlights(plugin_his)
    utils.highlights(filetype_his)
    utils.highlights(edtior)

    -- Terminal colors
    defs.terminal(colors)
end

-- local highlight = api.nvim_set_hl
--
-- local function set_namespace(ns_name)
--     -- Color namespace
--     local ns = api.nvim_create_namespace(ns_name)
--
--     -- Activate namespace
--
--     -- This API isn't stable yet. It will receive breaking changes
--     -- and be renamed to nvim_set_hl_ns later be aware of that.
--     -- for more details https://github.com/neovim/neovim/issues/14090#issuecomment-799285918
--     api.nvim__set_hl_ns(ns)
--
--     return ns
-- end

return gruvbox:new()
