includer = {}

includer.IncludeSharedFile = (file) ->
    AddCSLuaFile(file) if SERVER
    return include(file)

includer.IncludeClientFile = (file) ->
    AddCSLuaFile(file) if SERVER
    return include(file) if CLIENT

includer.IncludeServerFile = (file) ->
    return include(file) if SERVER

includer.IncludeModule = (name) ->
    initFilePath = "module/#{name}/scheme.lua"
    IncludeSharedFile(initFilePath)

includer.IncludeFiles = (files) ->
    includer.IncludeSharedFile(fileName) for fileName in *files.shared
    includer.IncludeServerFile(fileName) for fileName in *files.server
    includer.IncludeClientFile(fileName) for fileName in *files.client

{ :includer }