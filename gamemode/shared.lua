moon = { }
AddCSLuaFile('sh_includes.lua')
include('sh_includes.lua')
moon.config = { }
moon.IncludeSharedFile('config/config.lua')
local modules = {
  core = {
    'utils',
    'data',
    'money',
    'jobs',
    'base'
  }
}
local _list_0 = modules.core
for _index_0 = 1, #_list_0 do
  local module = _list_0[_index_0]
  moon.IncludeModule(module)
end
local root = GM.FolderName .. "/gamemode/customs/"
local files, _ = file.Find(root .. "*", "LUA")
for _index_0 = 1, #files do
  local file = files[_index_0]
  AddCSLuaFile(root .. file)
  include(root .. file)
end
