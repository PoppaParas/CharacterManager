-- @ScriptType: ModuleScript
local Parent = script.Parent

local Self = Parent.Self

local Components = Self.Components
local Properties = Self.Properties
local Systems = Self.Systems

local EventManager = require "../../Utils/EventManager"
local Typecasts = require "../../Utils/Typecasts"




local CharacterTypecasts = {}

export type Components = typeof(Components)
export type Systems = typeof(Systems)
export type Properties = typeof(Properties)



export type ComponentSystem = {
	
}


export type BaseCharacterFuncs = {
	AddComponent:(_:CharacterObject,Component:keyof<Components>)->(),
	AddSystem:(_:CharacterObject,System:keyof<Systems>)->(),
	AddProperty:(_:CharacterObject,Property:keyof<Properties>)->(),
	GetProperty:<ReturnType>(_:CharacterObject,Property:keyof<Properties>)->(ReturnType),

	CallComponent:<Args...,T...>(_:CharacterObject,Component:keyof<Components>,Args...)->(T...),
}

export type BaseCharacterData = {
	Character:Typecasts.Character,
	Player:Player?,
	SystemsEnabled:{
		keyof<Systems>
	},
	Properties:{
	[string]:any	
	},
}


export type CharacterObject = BaseCharacterData & BaseCharacterFuncs


return CharacterTypecasts
