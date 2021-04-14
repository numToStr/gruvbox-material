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

local attr_list = {
    bold = true,
    underline = true,
    undercurl = true,
    strikethrough = true,
    reverse = true,
    inverse = true,
    italic = true,
    standout = true,
    nocombine = true
}

local function hi_link(name, link)
    cmd(string.format("hi link %s %s", name, link))
end

function utils.highlight(name, param)
    if param.link then
        return hi_link(name, param.link)
    end

    local options = {"highlight", name}
    local special = {}

    for k, v in pairs(param) do
        if k == "fg" then
            table.insert(options, string.format("guifg=%s ctermfg=%s", v[1], v[2]))
        elseif k == "bg" then
            table.insert(options, string.format("guibg=%s ctermbg=%s", v[1], v[2]))
        elseif k == "default" then
            table.insert(options, 2, "default")
        elseif attr_list[k] then
            table.insert(special, k)
        end
    end

    local special_str = table.concat(special, ",")
    if #special_str > 0 then
        table.insert(options, string.format("gui=%s cterm=%s", special_str, special_str))
    else
        table.insert(options, string.format("gui=%s cterm=%s", "NONE", "NONE"))
    end

    cmd(table.concat(options, " "))
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
