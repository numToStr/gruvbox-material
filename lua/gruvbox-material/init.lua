local definitions = require("gruvbox-material.definitions")
local utils = require("gruvbox-material.utils")
local g = vim.g
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

    -- Color namespace
    -- local ns = set_namespace("gruvbox-material")
    local defs = definitions.get_definitions(c)

    -- Set highlights
    for color_name, param in pairs(defs) do
        -- highlight(color_name, param)
        utils.highlight(color_name, param)
    end
end

return gruvbox
