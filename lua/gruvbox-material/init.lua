local palette = require("gruvbox-material.palette")
local definitions = require("gruvbox-material.definitions")
local utils = require("gruvbox-material.utils")

local o = vim.o
local g = vim.g
local set_var = vim.api.nvim_set_var

-- local highlight = api.nvim_set_hl

local gruvbox = {}

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

function gruvbox.setup()
    local c = utils.configure(g.gruvbox_material)

    local colors = palette.get_palette(c.background, c.palette)

    -- Color namespace
    -- local ns = set_namespace("gruvbox-material")
    local defs = definitions.get_definitions(c, colors)

    -- Set highlights
    for color_name, param in pairs(defs) do
        -- highlight(color_name, param)
        utils.highlight(color_name, param)
    end

    -- ####### Terminal: Start
    if o.termguicolors then
        local dark = palette.is_dark and colors.bg5[1] or colors.fg0[1]
        local light = palette.is_dark and colors.fg0[1] or colors.bg5[1]

        set_var("terminal_color_0", dark)
        set_var("terminal_color_1", colors.red[1])
        set_var("terminal_color_2", colors.green[1])
        set_var("terminal_color_3", colors.yellow[1])
        set_var("terminal_color_4", colors.blue[1])
        set_var("terminal_color_5", colors.purple[1])
        set_var("terminal_color_6", colors.aqua[1])
        set_var("terminal_color_7", light)

        set_var("terminal_color_8", dark)
        set_var("terminal_color_9", colors.red[1])
        set_var("terminal_color_10", colors.green[1])
        set_var("terminal_color_11", colors.yellow[1])
        set_var("terminal_color_12", colors.blue[1])
        set_var("terminal_color_13", colors.purple[1])
        set_var("terminal_color_14", colors.aqua[1])
        set_var("terminal_color_15", light)

        set_var("terminal_color_background", dark)
        set_var("terminal_color_foreground", light)
    end
    -- ####### Terminal: End
end

return gruvbox
