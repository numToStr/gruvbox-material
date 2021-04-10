local definitions = require("gruvbox-material.definitions")
local api = vim.api
local highlight = api.nvim_set_hl
local cmd = api.nvim_command

local gruvbox = {
    defaults = {
        enable = true, -- boolean
        background = "hard", -- 'hard' | 'medium' | 'soft'
        palette = "material", -- 'material' | 'mix' | 'original'
        italic = false,
        italic_comment = false,
        bold = false,
        curor = "auto", -- `'auto'`, `'red'`, `'orange'`, `'yellow'`, `'green'`, `'aqua'`, `'blue'`, `'purple'`
        transparent_bg = false,
        visual = "grey background", -- `'grey background'`, `'green background'`, `'blue background'`, `'red background'`, `'reverse'`
        menu_bg = "grey", -- `'grey'`, `'red'`, `'orange'`, `'yellow'`, `'green'`, `'aqua'`, `'blue'`, `'purple'`
        sing_column_bg = "default", -- `'default'`, `'none'`
        -- LSP
        diagnostic_text_highlight = false,
        diagnostic_line_highlight = false,
        cursor_word = "grey background", -- `'grey background'`, `'bold'`, `'underline'`, `'italic'`
        statusline_style = "default", -- `'default'`, `'original'`
        better_perf = false
    }
}

cmd("hi clear")

local function set_namespace(ns_name)
    -- Color namespace
    local ns = api.nvim_create_namespace(ns_name)

    -- Activate namespace

    -- This API isn't stable yet. It will receive breaking changes
    -- and be renamed to nvim_set_hl_ns later be aware of that.
    -- for more details https://github.com/neovim/neovim/issues/14090#issuecomment-799285918
    api.nvim__set_hl_ns(ns)

    return ns
end

function gruvbox.setup(opts)
    opts = opts ~= nil and vim.tbl_extend("keep", gruvbox.defaults, opts) or gruvbox.defaults

    -- Color namespace
    local ns = set_namespace("gruvbox-material")
    local defs = definitions.get_definitions(opts)

    -- Set highlights
    for color_name, param in pairs(defs) do
        highlight(ns, color_name, param)
    end

    if opts.enable then
        cmd("colorscheme gruvbox-material")
    end
end

return gruvbox
