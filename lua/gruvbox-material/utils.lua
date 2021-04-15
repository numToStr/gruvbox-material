-- Clear old highlights
local cmd = vim.api.nvim_command
local utils = {}

local defaults = {
    background = "hard", -- 'hard' | 'medium' | 'soft'
    palette = "material", -- 'material' | 'mix' | 'original'
    transparent_bg = false,
    italic = false,
    italic_comment = false,
    bold = false,
    -- LSP
    diagnostic_text_highlight = false,
    diagnostic_line_highlight = false,
    -- {'treesitter', 'coc', 'vim-lsp', 'ycm', 'ale', 'telescope', 'git-gutter', 'easymotion', 'vim-sneak','vim-plug', 'nerdtree', 'vim-startify', 'hop.nvim', 'nvim-tree', 'gitsigns'}
    plugins = {}
}

-- local attr_list = {
--     bold = true,
--     underline = true,
--     undercurl = true,
--     strikethrough = true,
--     reverse = true,
--     inverse = true,
--     italic = true,
--     standout = true,
--     nocombine = true
-- }

local function hi_link(name, link)
    cmd(string.format("hi link %s %s", name, link))
end

function utils.highlight(name, param)
    if param.link then
        return hi_link(name, param.link)
    end

    local fg = param.fg or {"NONE", "NONE"}
    local bg = param.bg or {"NONE", "NONE"}
    local gui = param.gui or "NONE"

    local exec =
        string.format(
        "highlight! %s guifg=%s ctermfg=%s guibg=%s ctermbg=%s gui=%s",
        name,
        fg[1],
        fg[2],
        bg[1],
        bg[2],
        gui
    )

    cmd(exec)
end

function utils.configure(opts)
    if not opts then
        return defaults
    end

    local config = vim.tbl_extend("keep", opts, defaults)

    -- Converting plugins list to a table for better lookup
    local plugins = {}
    for _, v in ipairs(config.plugins) do
        plugins[v] = true
    end

    config.plugins = plugins

    return config
end

return utils
