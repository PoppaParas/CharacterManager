-- @ScriptType: ModuleScript
local Player = game:GetService("Players")

local Self = script:WaitForChild("Self")

local EventManager = require "../Utils/EventManager"
local Typecasts = require "../Utils/Typecasts"
local CharacterTypecasts = require "@self/Typecasts"
local Systems = require(Self.Systems)
local Properties = require(Self.Properties)
local Components = require(Self.Components)


local CharacterManager = {}

local CharacterObject:CharacterTypecasts.BaseCharacterFuncs = {}
CharacterObject.__index = CharacterObject
local CharacterData = {

} 
local CharacterCache:{[Typecasts.Character]:CharacterTypecasts.CharacterObject}= {

}

local function CheckAddSystem(Type:keyof<typeof(Self)>)

	local Module:ModuleScript = Self:FindFirstChild(Type)
	if not Module or not Module:IsA("ModuleScript") then return end

end

function CharacterManager.Fetch(Character:Typecasts.Character) : CharacterTypecasts.CharacterObject
	return CharacterCache[Character]
end

function CharacterManager.new(Character:Typecasts.Character) : CharacterTypecasts.CharacterObject
	local Fetch = CharacterManager.Fetch(Character) 
	if Fetch then return Fetch end
	local self:CharacterTypecasts.CharacterObject = setmetatable({},CharacterObject)
	self.Player = game.Players:GetPlayerFromCharacter(Character)
	self.Character = Character
	self.Properties = {}
	self.Components = {}
	self.Systems = {}
	self.EventContainer = EventManager.new()

	CharacterCache[Character] = self 
	return self
end



function CharacterObject:CallComponent(Component:keyof<CharacterTypecasts.Components>,...)
	return Components.Call(self,Component,...)
end



return CharacterManager
