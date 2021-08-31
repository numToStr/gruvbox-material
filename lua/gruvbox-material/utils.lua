-- Clear old highlights
local cmd = vim.api.nvim_command
local utils = {}

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

function utils.highlight(name, param)
    local fg = param.fg or { 'NONE', 'NONE' }
    local bg = param.bg or { 'NONE', 'NONE' }
    local gui = param.gui or 'NONE'

    local exec = string.format(
        'highlight! %s guifg=%s ctermfg=%s guibg=%s ctermbg=%s gui=%s cterm=%s',
        name,
        fg[1],
        fg[2],
        bg[1],
        bg[2],
        gui,
        gui
    )

    cmd(exec)

    if param.link then
        cmd('hi link ' .. name .. ' ' .. param.link)
    end
end

function utils.highlights(colors)
    for color_name, param in pairs(colors) do
        -- highlight(color_name, param)
        utils.highlight(color_name, param)
    end
end

return utils
