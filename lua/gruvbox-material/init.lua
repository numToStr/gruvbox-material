local palette = require("gruvbox-material.palette")
local definitions = require("gruvbox-material.definitions")
local utils = require("gruvbox-material.utils")

local g = vim.g
local loop = vim.loop

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
    local config = utils.configure(g.gruvbox_material)

    local colors = palette.get_palette(config.background, config.palette)

    -- Color namespace
    -- local ns = set_namespace("gruvbox-material")

    local async

    async =
        loop.new_async(
        vim.schedule_wrap(
            function()
                local plugin_his = definitions.plugins(config, colors)
                local filetype_his = definitions.filetypes(config, colors)

                utils.highlights(plugin_his)
                utils.highlights(filetype_his)

                definitions.terminal(colors)

                async:close()
            end
        )
    )

    async:send()

    local defs = definitions.editor(config, colors)

    utils.highlights(defs)
end

return gruvbox
