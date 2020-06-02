GM.Version = "1.0"
GM.Name = "Space Wars"
GM.Author = "Emperor Penguin Protector"

DeriveGamemode "sandbox"
DEFINE_BASECLASS "gamemode_sandbox"

GM.Sandbox = BaseClass

AddCSLuaFile "cl_init.lua" 
AddCSLuaFile "shared.lua" 

include "shared.lua"