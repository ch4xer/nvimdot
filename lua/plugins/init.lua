--[[

 ____  _    _   _  ____ ___ _   _ ____  
|  _ \| |  | | | |/ ___|_ _| \ | / ___| 
| |_) | |  | | | | |  _ | ||  \| \___ \ 
|  __/| |__| |_| | |_| || || |\  |___) |
|_|   |_____\___/ \____|___|_| \_|____/ 

 ]]
-- plugins
local edit_plugins = require('plugins.edit')
local interface_plugins = require('plugins.interface')
local sideview_plugins = require('plugins.sideview')
local theme_plugins = require('plugins.theme')
local lsp_plugins = require('plugins.lsp')

vim.cmd('packadd packer.nvim')
require('packer').startup(function()
    for _, plugin in pairs(edit_plugins.plugins) do use(plugin) end
    for _, plugin in pairs(interface_plugins.plugins) do use(plugin) end
    for _, plugin in pairs(sideview_plugins.plugins) do use(plugin) end
    for _, plugin in pairs(theme_plugins.plugins) do use(plugin) end
    for _, plugin in pairs(lsp_plugins.plugins) do use(plugin) end

end)

edit_plugins.load()
interface_plugins.load()
sideview_plugins.load()
theme_plugins.load()
lsp_plugins.load()