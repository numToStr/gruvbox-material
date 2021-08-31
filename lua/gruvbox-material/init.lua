local gruvbox = require('gruvbox-material.theme')

local m = {}

function m.setup(...)
    gruvbox:setup(...)
end

function m.load()
    gruvbox:load()
end

return m
