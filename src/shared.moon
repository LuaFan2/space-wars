{ :includer } = include "tools/includer.lua"

AddCSLuaFile('sh_includes.lua')
include('sh_includes.lua')

modules = {}

for module in *modules
    includer.IncludeModule(module)