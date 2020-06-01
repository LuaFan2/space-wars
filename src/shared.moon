export spaceWars

spaceWars = {}

AddCSLuaFile('sh_includes.lua')
include('sh_includes.lua')


modules = {
    core: {
    }
}

for module in *modules.core
    moon.IncludeModule(module)